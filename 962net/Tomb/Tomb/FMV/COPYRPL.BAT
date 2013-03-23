@echo off
if exist snow.rpl goto end
copy escape.rpl  CAFE.RPL       /y  > nul
copy escape.rpl  CANYON.RPL     /y  > nul
copy escape.rpl  CORE.RPL       /y  > nul
copy escape.rpl  END.RPL        /y  > nul
copy escape.rpl  LIFT.RPL       /y  > nul
copy escape.rpl  MANSION.RPL    /y  > nul
copy escape.rpl  PRISON.RPL     /y  > nul
copy escape.rpl  PYRAMID.RPL    /y  > nul
copy escape.rpl  SNOW.RPL       /y  > nul
copy escape.rpl  VISION.RPL     /y  > nul

:end
