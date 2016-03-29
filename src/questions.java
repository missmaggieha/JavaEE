//
//
//// for answers (must be arraylist!!)
//
//ArrayList<Answer> answers = new ArrayList<Answer>();
//
//// checkbox answers
//if(question.getType() == 1) {
//
//	Answer answer = new Answer();
//
//	answer.setText(request.getParameter("text1"));
//	answer.setIsCorrect(request.getParameter("is_correct1").checked);	// assuming that returns true/false
//	answers.add(answer);	// each one added needs a unique ID
//
//	answer.setText(request.getParameter("text2"));
//	answer.setIsCorrect(request.getParameter("is_correct2").checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text3"));
//	answer.setIsCorrect(request.getParameter("is_correct3").checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text4"));
//	answer.setIsCorrect(request.getParameter("is_correct4").checked);
//	answers.add(answer);
//}
//
//
//// dropdown answers
//if(question.getType() == 2) {
//
//	Answer answer = new Answer();
//	String dropdownAnswers[] = getParameterValues("dropdownAnswer");
//
//	answer.setText(request.getParameter("text1"));
//	answer.setIsCorrect(dropdownAnswers[0].checked);	// assuming .checked returns true or false
//	answers.add(answer);	// needs unique ID
//
//	answer.setText(request.getParameter("text2"));
//	answer.setIsCorrect(dropdownAnswers[1].checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text3"));
//	answer.setIsCorrect(dropdownAnswers[2].checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text4"));
//	answer.setIsCorrect(dropdownAnswers[3].checked);
//	answers.add(answer);
//}
//
//// radio answers
//if(question.getType() == 3) {
//
//	Answer answer = new Answer();
//	String radioAnswers[] = getParameterValues("radioAnswer");
//
//	answer.setText(request.getParameter("text1"));
//	answer.setIsCorrect(radioAnswers[0].checked);	// assuming .checked returns true or false
//	answers.add(answer);	// needs unique ID
//
//	answer.setText(request.getParameter("text2"));
//	answer.setIsCorrect(radioAnswers[1].checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text3"));
//	answer.setIsCorrect(radioAnswers[2].checked);
//	answers.add(answer);
//
//	answer.setText(request.getParameter("text4"));
//	answer.setIsCorrect(radioAnswers);
//	answers.add(answer);
//}
//
//
//// numeric input answers, // text input answers
//if(question.getType == (4 ||5)) {
//	Answer answer = new Answer();
//
//	answer.setText(request.getParameter("text1"));
//	answer.setIsCorrect("true");
//
//	answers.add(answer);
//}
//
//
//
//
//
//
//
