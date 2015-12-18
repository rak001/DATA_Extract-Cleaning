############################################# info ###########################################
file_path<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
file_dest<-"xBLM_RESTData"
Type=".csv"
availabilty='false'
##############################################################################################

  if(tolower(availabilty)=='false')
  {
  sink(paste(file_dest,'.txt'))
  sysOS<-unname(Sys.info()['sysname'])
  
  cat(sprintf("System OS ==> %s\n",sysOS))
  
  fileurl<-file_path
  
  cat(sprintf("file url  ==> %s\n",fileurl))
  
  dest_file<-paste(file_dest,Type)
  
  cat(sprintf("file save ==> %s\n",dest_file))
  
  
  if(sysOS=="Windows"){
    download.file(fileurl,destfile=dest_file)
  }
  if(sysOS=="Mac")
  {
    download_method<-"curl"
    download.file(fileurl,destfile=dest_file,method = download_method )
  }
  
  cat("==========================================================================\n")
  
  RESTData<-read.csv(dest_file)
  ## dim
  nx<-dim(RESTData)
  cat("Data Dimension [observation,Variable] ---->\n\n") 
  print(nx)
  cat("\n")
  cat("==========================================================================\n")
  ## preview data
  cat("Preview Data ---->\n\n")
  print(head(RESTData,n=3))
  cat("\n\n")
  cat("==========================================================================\n")
  ## Data Variable
  cat("Data Variable ---->\n\n")
  print(names(RESTData))
  cat("\n\n")
  cat("==========================================================================\n")
  ## Summary
  cat("Data Summary ---->\n\n")
  print(summary(RESTData))
  cat("\n\n")
  cat("==========================================================================\n")
  sink()
  }
  
  if(tolower(availabilty)=='true')
  {
    sink(paste(file_dest,'.txt'))
    
    sysOS<-unname(Sys.info()['sysname'])
    
    cat(sprintf("System OS ==> %s\n",sysOS))
    
    fileurl<-file_path
    
    cat(sprintf("file path  ==> %s\n",fileurl))
    
    dest_file<-paste(file_dest,Type)
    
    cat(sprintf("file save ==> %s\n",paste(file_dest,'.txt')))
    cat("==========================================================================\n")
    RESTData<-read.csv(file_path)
    ## dim
    nx<-dim(RESTData)
    cat("Data Dimension [observation,Variable] ---->\n\n") 
    print(nx)
    cat("\n\n")
    cat("==========================================================================\n")
    ## preview data
    cat("Preview Data ---->\n\n")
    print(head(RESTData,n=3))
    cat("\n\n")
    cat("==========================================================================\n")
    ## Data Variable
    cat("Data Variable ---->\n\n")
    print(names(RESTData))
    cat("\n\n")
    cat("==========================================================================\n")
    ## Summary
    cat("Data Summary ---->\n\n")
    print(summary(RESTData))
    cat("\n\n")
    cat("==========================================================================\n")
    sink()
    
  }
  
  
