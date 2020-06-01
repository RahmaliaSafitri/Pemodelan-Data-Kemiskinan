function [data]=searchfiles()
    % =====================================================================
    % Input and save data
    % ---------------------------------------------------------------------
    % Output :
    % data   : Data yang ingin di olah
    % =====================================================================
    [nurfzh mfdl]=uigetfile({'*.*','File Selector'});
    data=xlsread(nurfzh); fprintf('[ Info Files : ');
    inf=fprintf(strcat(nurfzh)); fprintf(' ]\n');
    % =====================================================================
    % Link      :
    % Email     : muhfadil006@gmail.com
    % Facebook  : http://www.facebook.com/atha.statistika
    % Number/WA : +62853-9147-9417
    % =====================================================================
return