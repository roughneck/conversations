//= require_tree .

$(function () {
  $('#conversations_user_conversation_to_tokens').tokenInput('/users.json', { crossDomain: false });
});