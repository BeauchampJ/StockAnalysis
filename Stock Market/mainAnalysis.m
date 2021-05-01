%mainAnalysis.m
%Created by Jacob Beauchamp
%Created 5/1/21
%Github: www.github.com/beauchampJ
%Purpose of this package is to allow importation of company stock data from
%yahoo finance and allow for various trend analysis of an individual stock.


%Checks to see if the user wants to erase all imported data or keep it for
%comparison.
restart=input('Erase all current data? (y or n): ');
if restart=='y'
clc;clear;close all;
end

%adds csv_files to path
addpath('csv_files')

%Allows user to type in the file name they want to analyze. This is helpful
%so the user can have multiple files stored in one place
 %combines ticker and csv so the computer knows the file name.
ticker=input('Ticker name: ');
csv='.csv';
ticker=append(ticker,csv);

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













