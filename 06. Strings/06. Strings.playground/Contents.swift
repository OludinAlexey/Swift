let userName: String = "ivanov.iv"
let name: String = "Илья"
let surname: String = "Иванов"
let patronimic: String = "Владимирович"
let birthCity: String = "Волгоград"

var fullName: String = surname + " " + name + " " + patronimic

print("Уважаемый \(fullName), при регистрации вы указали следующую информацию:" +
      "\nИмя пользователя: \(userName)" +
      "\nРодной город: \(birthCity)" +
      "\nЕсли все верно, нажмите кнопку продолжить.")

//Далее код, отображающий и обрабатывающий нажатие кнопки "Продолжить"
