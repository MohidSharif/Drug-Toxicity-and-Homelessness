# Homelessness and Drug Toxicity

## Overview

This repo provide that data, scripts and qmd files for the paper Homelessness and Drug Toxicity. This study investigated fatalities due to drug toxicity among the homeless population over the years, examining trends across age and gender. The study highlights the neglected state of the homeless in Toronto, which require targeted interventions to bolster their welfare especially during a public health crisis. The data for this repo is from opendatatoronto with the file structure below and available scripts to reproduce this paper and the individual aspects for the paper including the data, scripts, qmd files. We have also simulated the data which is avaiable in the data folder and was generated using the scripts/.00-simulate_data.R file. 

## How to Use
To replicate our findings or conduct further analyses:

Clone this repository to your local machine.
Navigate to the relevant directories for data, scripts, or qmd files.
Follow the instructions provided within each directory and comments to reproduce the paper or conduct specific analyses.
Feel free to reach out if you encounter any issues or require further clarification. We encourage collaboration and feedback to enhance the robustness and impact of this research.

Thank you for your interest in our study on homelessness and drug toxicity. Together, we can work towards addressing this pressing societal challenge and improving the lives of vulnerable populations.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains the details for the  LLM chat interactions and sketches of graphs and the data.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, model and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, Codriver and chat GPT 3.5.The entire chat history is available in other/llm folder.
