##### I'm writing a new function to write afni files b/c it's getting too confusing to have distributed scripts.

### I'm not going to write this. I'm just going to stick with what I have for now.


makeAfniFiles <- function(subSettedData, onsetVarName, timingFileName, 
                          nRuns = 1, blockNameVar = NA){
  # this function writes out onsetted files.  
  # accepts subsetted data set, and outut
  if(blockNameVar == NA)
  
  onsetList <- list()
  onsets <- subSettedData[ ,onsetVarName]
  
  
  
}

### make low reward stim file HIT ####
filename_low_rwd <- paste(sub_prefix,"_view_low_rwd_study_HIT_allblocks.txt",sep="")
low_reward_encode_onsets <- list()

if(nRuns > 0 && )
for (iter_block in 1: nRuns){
  low_reward_onsets_iter <- sub_data[sub_data$block==iter_block & sub_data$reward=='N' & sub_data$finaltest_correct=='1','reward_onset']
  if(length(low_reward_onsets_iter) >0){
    low_reward_encode_onsets[[iter_block]] <- low_reward_onsets_iter
  }else (low_reward_encode_onsets[[iter_block]] <-"*") #necessary for empty blocks
}
# write seperately
sink(file=filename_low_rwd)
for (iter_block in 1: n_blocks){
  cat(low_reward_encode_onsets[[iter_block]],"\n",sep=" ")
}
sink(file=NULL)