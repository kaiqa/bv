# bv
ruby watir form automation

Execute from terminal:
- ruby specForm.rb chrome https://jotformeu.com/201882323530347

Reports: 
- report.html
log:
- folder -> logs
- screenshots -> scrcap


Issues:

The form:
- The form can be send without reasonable data
- Pages can be skipped and form can be send .
- Only selecting the type of security question is mandatory

Name_page
- can be skipped
- no field validation, eg. Name can contain numbers and special characters
 	Example: first name 3255324 last name fas@fsda43324
- no footer timeline navigation when the page is first shown

Signature_page
- when drawing the is sometimes not centred but aligned to the left

Date_page
- No reasonable boundaries eg 01-01-1000

Security_question
- The first drop down item is empty
- Typo in text ‘you answer’ should be ‘your answer’
 
Footer timeline navigation
- Step 2 is missing the name in the tool tip. Is 2. Should be 2.Attachment
- No tooltips on active page on bottom timeline navigation
- Green indicator persistent on date page after the date entry is removed


Further observation:
- Some times no centre alignments of the page elements
(Not reproducible)
- Footer Timeline navigation disapears 


