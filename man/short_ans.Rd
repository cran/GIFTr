% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/short_ans.r
\name{short_ans}
\alias{short_ans}
\title{Generate 'GIFT' Short Answer From Spreadsheet}
\usage{
short_ans(data, questions, answers, categories, question_names = NULL,
  output, verbose = TRUE)
}
\arguments{
\item{data}{dataframe or tibble of short answer questions data}

\item{questions}{name(string) or index(integer) of the questions column}

\item{answers}{a vector of names(strings) or indices of answers column(s)}

\item{categories}{name(string) or index(integer) of categories column if available, Default: NULL}

\item{question_names}{name(string) or index(integer) of the questions names column. If NULL, it will be the first 40 letters of the question title, Default: NULL}

\item{output}{string of .txt file name and path where the questions will be exported to.}

\item{verbose}{If TRUE, the functions will print to the console the statistics of writing the output, Default: TRUE}
}
\value{
None
}
\description{
Create 'GIFT' file with short answer questions from a spreadsheet to be exported to LMS.
}
\details{
\code{short_ans} function takes a dataframe with short answer questions and export a text file in 'MOODLE' GIFT format. The function automatically makes a short answer question either single or multiple with or without different credit weight according to your data format(check short answer questions formatting below). If you have additional column of question_type set to `short_ans` you can also use \link{GIFTr} function which wraps all question generating functions.\cr\cr See Vignette and \link{GIFTrData} for demos.
}
\section{Short Answer Questions Formatting}{

Short answer question answers can be in single column or multiple columns. If an answer has not credit it will be given 100\% credit automatically. For example if the answer is 'statistics', it will be equivalent to '\%100\%statistics'. While '\%80\%Data Science' answer will take 80\% of the credit  \cr\cr For further illustration, check \link{GIFTrData}.
}

\section{Formatting Your Data}{
 A guideline for creating you questions data can be found below. Check the data \code{\link{GIFTrData}} and  \code{\link{GIFTrData_2}} as example for formatted questions.
\subsection{Markdown, HTML Support and LATEX support}{
'MOODLE' itself supports basic markdown and HTML for questions formatting. So when formatting your data you can use HTML tags like <sub> and <sup>. Also you can use markdown  **bold** or __bold__ and  *italic* or _italic_ ...etc. However it is better a better practice to avoid using asterisk to avoid confusion with MCQ format. For more about the supported markdown see \href{https://docs.moodle.org/37/en/Markdown}{'MOODLE' documentation}.
}

\subsection{LATEX Support}{'MOODLE' also supports inline and block LATEX equations through \href{https://www.mathjax.org/}{mathjax}, however you have to be careful with the \href{https://docs.moodle.org/37/en/GIFT_format#Special_Characters_.7E_.3D_.23_.7B_.7D}{special characters} like curly brackets /{/} and equal sign = , so you have to use back slash before those to ensure you can import correctly.\cr\cr Note that if you see thee data in console, you will find it with 2 backslash \\, however that's the escaping of the backslash in R and you write with with single slash normally. Check \link{GIFTrData} \code{GIFTrData[11,3]}for an example. For further details on LATEX, check \href{https://docs.moodle.org/23/en/Using_TeX_Notation}{'MOODLE' docs}.}
\subsection{Answer Feedback}{You can easily choose to enter a feedback by using #sign after the answer you want to specify a feedback on. Check \link{GIFTrData} for examples.}
\subsection{Data columns}{The data passed would differ slightly according to question type, however generally you need to have: \enumerate{
\item a column contains question. This cannot contain empty values
\item answer(s) column(s). This may be multiple columns if you have multiple answers. If you mix single and multiple answer it is better to write the single answer in the first column. If you have \strong{only single answer MCQ and NO multiple answer MCQ}, you can set the answers without asterisk in the first column of the answers columns. More details in the vignette and below.
\item a column specifying the type of question. The current supported questions are multiple choices, numerical entry, true or false and short answer questions. The should be named 'mcq' , 'num_q' , 'tf_q' and 'short_ans' respectively.
\item a column specifying categories and subcategories in the 'MOODLE' categories are important when you are preparing a quiz as you may want to specify certain proportions of inclusions. Categories and subcategories are spaced by forward slash like Categ1/subcateg1/subsubcateg1 ...etc.
\item a column specifying question names. So you can easily enter a certain question names by like certain ID or keyword to make the questions easily on the system. however you don't need to worry about that as automatically if not set, the first 40 letter are set a question name.


}
  }
}

\examples{
data(GIFTrData)
#data with short answer question type
shortans_data <- GIFTrData[which(GIFTrData$question_type == "short_ans"),]

short_ans(data = shortans_data, questions = 3,
 answers = c(4:8), categories = 1,
 question_names = 2, output = file.path(tempdir(), "shortq.txt"))
 #write file "shortq.txt" in tempdir()

}
\seealso{
\code{\link[GIFTr]{GIFTr}}
}
