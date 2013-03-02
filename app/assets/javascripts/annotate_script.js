function blackNote() {
  return $(document.createElement('span')).addClass('black circle note');
}

$('#pdf').annotatableImage(blackNote);