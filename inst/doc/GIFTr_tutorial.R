## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
library(GIFTr)
library(kableExtra)
options(knitr.kable.NA = '')
knitr::kable(head(GIFTrData , 0) , ) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData[c(1,2),]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData_2[c(1),]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData[which(GIFTrData$question_type == "num_q"),]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData[which(GIFTrData$question_type == "short_ans"),]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData[which(GIFTrData$question_type == "tf_q"),]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData[c(1,9),c(4:8)]) %>%
  kable_styling(full_width = TRUE)

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(GIFTrData) %>%
  kable_styling(full_width = TRUE)

## ------------------------------------------------------------------------
library(GIFTr)
head(GIFTrData)
str(GIFTrData)

## ------------------------------------------------------------------------

GIFTr::GIFTr(data = GIFTrData, question_names = 2, 
             questions = 3, answers = c(4:8), 
             categories = 1, question_type = 9,
            output = file.path(tempdir(), "quiz.txt"))  


