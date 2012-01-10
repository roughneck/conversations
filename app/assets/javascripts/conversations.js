//= require_tree .

$(function () {
  $('#conversations_conversation_to_tokens').tokenInput('/users.json', { crossDomain: false });
});