// ---------------------------
// Wrote By chan78@esofnet.com
// Last Updated at 2001/10/22
// ---------------------------
#define _WIN32_WINNT 0x0500

#include <stdio.h>
#include <stdarg.h>
#include <time.h>
#include "mylog.h"
#include "monitor.h"
#include <afxmt.h>


// Default Log Level
int ConsoleLogLevel = 2;
int FileLogLevel = 7;

CRITICAL_SECTION g_LogManager;
FILE *fpLog = NULL;

void InitMyLog( void )
{
	InitializeCriticalSectionAndSpinCount(&g_LogManager, 1000);
	return;
}

void FreeMyLog( void )
{
	DeleteCriticalSection(&g_LogManager);

	if( fpLog )
	{
		fclose( fpLog );
	}
	return;
}

// Must be thread-safe function.
void MyLog( int type, char *logmsg, ... )
{
	va_list vargs;
	struct tm *now;
	time_t nowTime;

	int year, mon, day;
	static int log_year = 0, log_mon = 0, log_day = 0;
	int hour, min, sec;

	char LogIdentifier[NUM_OF_LOG_TYPE] = { 'A', 'B', 'C', 'D', 'E', 'F' };
	char buf[(MAX_LOG_LENGTH*10)+1];
	static char sLogFileName[80+1];

	// Filtering unlogable things
	if( (type < 0) && (type >= NUM_OF_LOG_TYPE ) )
	{
		// Self-calling.
		MyLog( LOG_FATAL, "Unknown LOG_TYPE" );
		return;
	}

	if( (ConsoleLogLevel < type) && (FileLogLevel < type) )
	{
		return;
	}

	// Argument Processing
	va_start( vargs, logmsg );

	// Get nowtime
	time( &nowTime );
	now = localtime(&nowTime);

	// Make it usable.
	year = now->tm_year + 1900;
	mon  = now->tm_mon + 1;
	day  = now->tm_mday;
	hour = now->tm_hour;
	min  = now->tm_min;
	sec  = now->tm_sec;

	// Lock...
	EnterCriticalSection(&g_LogManager);

	if( log_year && ( (log_year != year) || (log_mon != mon) || (log_day != day) ) )
	{
		// Close fpLog
		fclose( fpLog );
		fpLog = NULL;

		// Clear log_year
		log_year = 0;
	}

	if( log_year == 0 || !fpLog )
	{
		// Set log_year, log_mon, log_day.
		log_year = year;
		log_mon = mon;
		log_day = day;

		sprintf( sLogFileName, ".\\%d-%d-%d.log", year, mon, day );

		if( !(fpLog = fopen( sLogFileName, "a" )) )
		{
			// Notify ERROR
			sprintf( buf, "FATAL ERROR at MyLog() :: Can't open LogFile('%s')", sLogFileName );
			WriteText( buf );
			goto ReturnMyLogAfterEnterCriticalSection;
		}
	}

	// Write Log Type
	buf[0] = LogIdentifier[type];
	buf[1] = ' ';

	// Write Log rised time.
	sprintf( buf+2, "<%2d:%2d:%2d> ", hour, min, sec );

	// Write Log's Body.
	if( strlen( logmsg ) > (MAX_LOG_LENGTH-2-11) )
	{
		// Self-calling.
		MyLog( LOG_FATAL, "Map() Too long string - This log will be lost" );
		va_end( vargs );
		goto ReturnMyLogAfterEnterCriticalSection;
	}

	// Caution!!!
	// buf[] can be overflowed if arguments are too large to write on buf[]'s own available space.
	// We only know the length of format. But Result can larger or smaller than format's own length.
	// If buf[] overflowed, the Map server will crashed down.
	// SO buf[] MUST LARGE ENOUGH TO CONTAIN LOG MESSAGES.
	if( type == LOG_JUST_DISPLAY )
	{
		vsprintf( buf, logmsg, (vargs) );
	}
	else
	{
		vsprintf( buf+2+11, logmsg, (vargs) );
	}
	
	// Now Log it.
	// To Screen
	if( (ConsoleLogLevel >= type) || (type == LOG_JUST_DISPLAY) )
	{
		WriteText( buf );
	}
	
	// To File
	if( fpLog && (FileLogLevel >= type) )
	{
		strcat( buf, "\n" );
		fputs( buf, fpLog );
		// this can make server to slow.
		fflush( fpLog );
	}

ReturnMyLogAfterEnterCriticalSection:
	LeaveCriticalSection(&g_LogManager);
	
	// Finish Func
	va_end( vargs );
	return;
}	
		