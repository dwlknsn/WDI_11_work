$(document).ready(function(){
  soundManager.setup({
    url: '/wavs/',
    onready: function() {
    }
  });

  var soundHash = {
    113: ['q', 'work-it'],
    119: ['w', 'harder'],
    101: ['e', 'make-it'],
    114: ['r', 'better'],
    97: ['a', 'do-it'],
    115: ['s', 'faster'],
    100: ['d', 'makes-us'],
    102: ['f', 'stronger'],
    121: ['y', 'more-than'],
    117: ['u', 'ever'],
    105: ['i', 'hour'],
    111: ['o', 'after'],
    104: ['h', 'our'],
    106: ['j', 'work-is'],
    107: ['k', 'never'],
    108: ['l', 'over']
  };

  $(document).on('keypress', function(e){
    console.log(soundHash[e.which][1]);
    var id = soundHash[e.which][1];
    playSound(id);
  });

  function playSound(id){
    var mySound = soundManager.createSound({
      url: 'wavs/' + id + '.wav'
    });
    mySound.play();
  }
})


// version 1 - play sound on click
$('.key').on('click', function(){
  var id = this.id;
  playSound(id);
});

// version 2 - play sound on keypress

// load jQuery DONE
// load main.js DONE
// load soundmanager2.js DONE
// set up document.ready function DONE
// event listener for clicking on an element with class='.key' DONE
// play a sound when that element is clicked DONE
// refactor to get id from that element and play a specific sound when a specific element is clicked DONE
// add keypress listener DONE