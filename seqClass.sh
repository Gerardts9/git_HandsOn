#!/bin/bash
seq=$1
seq=$(echo $seq | tr a-z A-Z)  # Identifies the type of sequence
if [[ $seq =~ ^[ACGTU]+$ ]]; then
  if [[ $seq =~ T ]]; then
    echo "The sequence is DNA"
  elif [[ $seq =~ U ]]; then
    echo "The sequence is RNA"
  else
    echo "The sequence can be DNA or RNA"
  fi
else
  echo "The sequence is not DNA nor RNA"
fi
motif=$(echo $2 | tr a-z A-Z) # Finds simple motifs in the sequence
if [[ -n $motif ]]; then
  echo -en "Motif search enabled: looking for motif '$motif' in sequence '$seq'... "
  if [[ $seq =~ $motif ]]; then
    echo "MOTIF FOUND"
  else
    echo "MOTIF NOT FOUND"
  fi
fi
