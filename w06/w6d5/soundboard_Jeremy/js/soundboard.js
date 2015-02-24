$(document).ready(function() {

  soundManager.setup({
    url: 'swf/',
    flashVersion: 9, 
    preferFlash: false,
    onready: function() {
      // Ready to use; soundManager.createSound() etc. can now be called.
    }
  });

  var keys = {
    '32': 'space-bar',
    '113': 'q',
    '119': 'w',
    '101': 'e',
    '114': 'r'
  };

  function playSound(filename, extension) {
    var mySound = soundManager.createSound({
      id: filename,
      url: 'sounds/' + filename + '.' + extension
    });
    mySound.play();
  }

  function highlightKey(keyCode) {
    $('ul.row').find('li').removeClass('active');
    $('#' + keys[keyCode]).addClass('active');
  }

  function playInstrumental() {
    var instrumental = soundManager.getSoundById('instrumental');

    if(typeof instrumental === 'undefined') {
      var sound = soundManager.createSound({
        id: 'instrumental',
        url: 'sounds/instrumental.mp3'
      });
      sound.play();
    } else {
      soundManager.togglePause(instrumental.id);
    }
  }

  $(document).on('keypress', function(e) {
    switch (e.keyCode) {
      case 32:
        highlightKey(e.keyCode)
        playInstrumental()
        break;
      case 113:
        highlightKey(e.keyCode)
        playSound('work it', 'wav');
        break;
      case 119:  
        highlightKey(e.keyCode)  
        playSound('make it', 'wav');
        break;
      case 101:
        highlightKey(e.keyCode)
        playSound('do it', 'wav');
        break;
      case 114:    
        highlightKey(e.keyCode)
        playSound('makes us', 'wav');
        break;
      default:
        console.log('default');
    }
  });
});