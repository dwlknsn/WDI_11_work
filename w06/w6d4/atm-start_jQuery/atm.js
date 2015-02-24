$(document).ready(function(){
  // deposit money into the savings account
  // deposit money into the current account
  // withdraw money from the savings account
  // withdraw money from the current account
  // do some checking to make sure I've got enough money available
  // other validations (like not allowing user to enter negative values)

  function clearInputs(){
    $('#amount1, #amount2').val('');
  }

  function getCurrentBalance(account){
    var currentBalance = parseFloat(account.find('.balance').text());
    return currentBalance;
  }

  function getAmount(account){
    var amount = parseFloat(account.find('.amount').val());
    return amount;
  }

  function updateBalance(account, balance){
    account.find('.balance').text(balance);
  }

  // deposit money into the savings account
  $('.deposit').on('click', function(){
    var account = $(this).parent();
    var currentBalance = getCurrentBalance(account);
    var amount = getAmount(account);
    var newBalance = currentBalance + amount;

    updateBalance(account, newBalance);
    clearInputs();
  });

  // withdraw money from the savings account
  $('.withdraw').on('click', function(){
    var account = $(this).parent();
    var currentBalance = getCurrentBalance(account);
    var amount = getAmount(account);

    if (currentBalance >= amount){
      var newBalance = currentBalance - amount;
      updateBalance(account, newBalance);
    } else {
      return false
    }

    clearInputs();
  });

});

