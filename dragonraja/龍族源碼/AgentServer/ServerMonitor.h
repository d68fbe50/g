// ----------------------------------------------------------------------
//    File Name: ServerMonitor.h
// Last Updated: 2000/11/28 (by chan78)
//  Description: Function Prototypes
// ----------------------------------------------------------------------
#pragma once
#include "stdafx.h"

void SendConnectServerCount( DWORD dwConnectionIndex );
void SendCurrServerPort( DWORD dwConnectionIndex );
void SendPbs( char *temp, int len );