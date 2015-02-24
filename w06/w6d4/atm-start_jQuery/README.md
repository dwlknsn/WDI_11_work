## ATM Lab

The app will have just one page, and it will show checking account and savings account balances. You'll need to keep track of these balances. Under each account balance, show an input box with two buttons, one to deposit money and one to withdraw money.

What happens when the user wants to withdraw more money from the checking account than is in the account? 

The checking account has overdraft protection, so if a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account. If the withdrawal amount is more than the combined account balance, ignore it.

Overdraft protection does not work for savings withdrawals. 

When the balance in any account goes to $0, add a red border around the balance. Remove the border when the balance returns to more than $0.

