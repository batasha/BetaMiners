function removeFields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").fadeOut();
}

function addFields(link, association, content) {
  var newId = new Date().getTime();
  var regEx = new RegExp("new_" + association, 'g');
  $(link).parent().before(content.replace(regEx, newId)).prev().hide().fadeIn();
}

