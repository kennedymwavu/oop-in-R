box::use(
  R6[R6Class]
)

# ------------
# 
# Create a bank account R6 class that stores a balance and allows you to 
# deposit and withdraw money. 
# Create a subclass that throws an error if you attempt to go into overdraft. 
# Create another subclass that allows you to go into overdraft, but charges 
# you a fee.
# 
# ------------

BankAccount <- R6Class(
  classname = "BankAccount",
  public = list(
    balance = 0,
    deposit = \(amount) {
      self$balance <- self$balance + amount
      invisible(self)
    },
    withdraw = \(amount) {
      self$balance <- self$balance - amount
      invisible(self)
    }
  )
)

a <- BankAccount$new()
a$balance
a$deposit(300)
a$balance
a$withdraw(100)
a$balance

BankAccountNoOverdraft <- R6Class(
  classname = "BankAccountNoOverdraft",
  public = list(
    withdraw = \(amount) {
      new_balance <- self$balance - amount
      if (new_balance < 0) {
        msg <- sprintf(
          "You attempted to withdraw more than your current account balance: $%.2f",
          self$balance
        )
        stop(msg)
      }

      self$balance <- new_balance
      invisible(self)
    }
  ),
  inherit = BankAccount
)

b <- BankAccountNoOverdraft$new()
b$balance

b$deposit(300)
b$balance
b$withdraw(200)
b$balance
b$withdraw(200)

BankAccountOverdraftAtFee <- R6Class(
  classname = "BankAccountOverdraftAtFee",
  public = list(
    withdraw = \(amount, fee = 30) {
      new_balance <- self$balance - amount
      if (new_balance < 0) {
        new_balance <- new_balance - fee
      }
      self$balance <- new_balance
      invisible(self)
    }
  ),
  inherit = BankAccount
)

bb <- BankAccountOverdraftAtFee$new()
bb$balance
bb$deposit(300)
bb$balance
bb$withdraw(200)
bb$balance
bb$withdraw(150)
bb$balance
bb$withdraw(100)
bb$balance
