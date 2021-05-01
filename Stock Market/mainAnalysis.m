%mainAnalysis.m
%Created by Jacob Beauchamp
%Created 5/1/21
%Github: www.github.com/beauchampJ
%Purpose of this package is to allow importation of company stock data from
%yahoo finance and allow for various trend analysis of an individual stock.

%WARNING: WHEN INPUTTING A GRAPH, MAKE SURE THE FREQUENCY IS SET TO DAILY
%% Inputs
%Here's where the user is asked for a variety of things

%Checks to see if the user wants to erase all imported data or keep it for
%comparison.
restart=menu('Would you like to start from scratch?','Yes','No');
if restart==1
    clc;clear;close all;
end

%adds csv_files to path
addpath('csv_files')

%Allows user to type in the file name they want to analyze. This is helpful
%so the user can have multiple files stored in one place
%combines ticker and csv so the computer knows the file name.
ticker=inputdlg('Ticker name:');
ticker=string(ticker);
csv='.csv';
ticker=append(ticker,csv);

%This is used later for plotting
timeUnit=menu('Are your time units in days?','Yes','No');
if timeUnit==2
    warning('The program requires the data to be spaced in days for the calculations to be accurate');
end
timeUnit=('Number of Days');

%Asks if the graphs should be saved
wantSave=menu('Do you want to save all of the graphs and data?','Yes','No');



%% Script
dataTable=readtable(ticker,'PreserveVariableNames',true);%imports the csv as a data table

%stores the data into seperate variables for user manipulation
%Seperates each column into its own individual table
dates=dataTable(:,1);
open=dataTable(:,2);
high=dataTable(:,3);
low=dataTable(:,4);
closedata=dataTable(:,5);
adjClose=dataTable(:,6);
volume=dataTable(:,7);

%changes tables into variables

open=table2array(open);
high=table2array(high);
low=table2array(low);
closedata=table2array(closedata);
adjClose=table2array(adjClose);
volume=table2array(volume);
dates=rows2vars(dates);

x=[1:length(high)];

%Plots all of this data into seperate plots

figure('Name','Open Value')
openplot=plot(x,open);
title('Open Value');
ylabel('Dollars');
xlabel(timeUnit);
grid on

hold on
figure('Name','Recorded Highs')
highplot=plot(x,high);
title('Recorded Highs');
ylabel('Dollars');
xlabel(timeUnit);
grid on

figure('Name','Recorded Lows')
lowplot=plot(x,low);
title('Recorded Lows');
ylabel('Dollars');
xlabel(timeUnit);
grid on

figure('Name','Close Value')
closedataplot=plot(x,closedata);
title('Close Value');
ylabel('Dollars');
xlabel(timeUnit);
grid on

figure('Name','Adjusted Close Value')
adjCloseplot=plot(x,adjClose);
title('Adjusted Close Value');
ylabel('Dollars');
xlabel(timeUnit);
grid on

figure('Name','Volume')
volumeplot=plot(x,volume);
title('Volume');
ylabel('Dollars');
xlabel(timeUnit);
grid on

hold off

%% Doing some statistics on the data

last50day=closedata((length(closedata)-50):(length(closedata)),1);
movingAverage50=mean(last50day);
last200day=closedata((length(closedata)-200):(length(closedata)),1);
movingAverage200=mean(last200day);

%% Saving Graphs (if wanted)
if wantSave==1
    save([pwd '/dataSave/Statistics.mat'],'movingAverage50','movingAverage200');
    saveas(figure(1),[pwd '/dataSave/OpenValue']);
    saveas(figure(2),[pwd '/dataSave/RecordedHighs.fig']);
    saveas(figure(3),[pwd '/dataSave/RecordedLows.fig']);
    saveas(figure(4),[pwd '/dataSave/CloseValue.fig']);
    saveas(figure(5),[pwd '/dataSave/AdjustedCloseValue.fig']);
    saveas(figure(6),[pwd '/dataSave/Volume.fig']);
    disp('Figures and statistics successfuly saved!');
end
























