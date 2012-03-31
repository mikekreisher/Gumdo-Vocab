/**
 * @author Mike Kreisher
 */

$(document).ready(function(){
	$('.next_question_button').on('click', function(event){
		parent_div = $(this).closest('.vocab_question');
		parent_div.toggleClass('hidden');
		parent_div.next('.vocab_question').toggleClass('hidden');
	});
	
	$('#question1').toggleClass('hidden');
	setupQuestion($('#question1').attr('id'))
	
});

function setupQuestion(id) {
	$('#' +id + ' #answers ul li').on('click', function(event){
		var msg = ""
		$(this).closest($('div.next_question_button').toggleClass('hidden'));
		alert($(this).attr('id') + " | "+ $(this).closest($('#answers')).siblings('#question').children( 'h1').attr('id'));
		if($(this).attr('id') === $(this).closest($('#answers')).siblings('#question').children( 'h1').attr('id')){
			$(this).addClass('correct')
		} else {
			$(this).addClass('incorrect')
			$(this).siblings('#'+$('#question h1').attr('id')).addClass('correct')
			msg = "You are incorrect.";
			$.getJSON('/vocab_terms/'+$('#question h1').attr('id'), function(data){
				msg += " The correct answer is " + data.vocab_term.english;
				$('#message').html(msg);
				$('#dialog').dialog();
			});
			
		}
		$(this).unbind();
		$(this).siblings().unbind();
		$(this).closest($('div.next_question_button').toggleClass('hidden'));
		
		parent_div = $(this).closest('.vocab_question');
		setupQuestion(parent_div.next('.vocab_question').attr('id'));
	});
	
	
}

