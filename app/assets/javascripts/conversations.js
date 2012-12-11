//= require_tree .

$(function () {
  $('#conversations_conversation_to_tokens').tokenInput('/users.json', {
		crossDomain: false,
		propertyToSearch: 'email',
		prePopulate: $('#conversations_conversation_to_tokens').data('pre')
	});
});