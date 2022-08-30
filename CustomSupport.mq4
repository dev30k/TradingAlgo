//+------------------------------------------------------------------+
//|                                                CustomSupport.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

double lines[10][1];
int row=0,col=0;

int OnInit()
  {
//---


   string terminal_data_path=TerminalInfoString(TERMINAL_DATA_PATH);
   string filename=terminal_data_path+"\\MQL4\\Files\\"+"me.csv";
   int iFile=FileOpen("Support.csv",FILE_READ|FILE_SHARE_READ|FILE_CSV);
   if(iFile<0)
     {
      Print("Failed to open the file by the absolute path ");
      Print("Error code ",GetLastError());
     }
//--- correct way of working in the "file sandbox"
   ResetLastError();
   if (iFile != -1) {
       while(True) //loop through each cell
        {
          double temp = FileReadDouble(iFile); //read csv cell
          if(FileIsEnding(iFile)) break; //FileIsEnding = End of File
          lines[col][row]=temp; //save reading result to array
          if(FileIsLineEnding(iFile)) //FileIsLineEnding = End of Line
          {
            col = 0; //reset col = 0 for the next row
            row++; //next row
          }
          else
          {
            col++; //next col of the same row
          }
        }
        FileClose(iFile);
      
   
   
      
   }
        
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
