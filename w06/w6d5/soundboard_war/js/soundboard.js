$(document).ready(function() {
  soundManager.setup({
    url: 'sounds',
    onready: function() {
    }
  });

  var soundHash = {
    '32': 'space-bar',
    '49': ['1', ''],
    '50': ['2', ''],
    '51': ['3', ''],
    '52': ['4', ''],
    '53': ['5', ''],
    '54': ['6', ''],
    '55': ['7', ''],
    '56': ['8', ''],
    '57': ['9', ''],
    '48': ['0', ''],
    '113': ['q', ''],
    '119': ['w', ''],
    '101': ['e', ''],
    '114': ['r', 'yeah'],
    '116': ['t', 'oh_lord'],
    '121': ['y', 'group_war'],
    '117': ['u', 'what_is_it_good_for'],
    '105': ['i', 'nothing'],
    '111': ['o', ''],
    '112': ['p', ''],
    '97': ['a', 'absolutely'],
    '115': ['s', 'say_it_again'],
    '100': ['d', 'i_said_war'],
    '102': ['f', 'ah_war'],
    '103': ['g', 'listen_to_me'],
    '104': ['h', 'huh'],
    '106': ['j', 'huh-2'],
    '107': ['k', 'huh_3'],
    '108': ['l', 'huha'],
    '122': ['z', 'oh_lord'],
    '120': ['x', 'uh_huh'],
    '99': ['c', 'good_god'],
    '118': ['v', 'lookout'],
    '98': ['b', 'breath'],
    '110': ['n', ''],
    '109': ['m', '']
  };


  $(document).on('keypress', function(e){
    console.log(soundHash[e.which][1]);
    var filename = soundHash[e.which][1];
    playSound(filename, 'wav');
  });

  function playSound(filename, extension){
    var mySound = soundManager.createSound({
      url: 'sounds/' + filename + '.' + extension
    });
    mySound.play();
  }

  function highlightKey(keyCode) {
    $('ul.row').find('li').removeClass('active');
    $('#' + keys[keyCode]).addClass('active');
  }
});