let erikDavidovich = (maxNumberOfPushups: 187, maxNumberOfSquats: 353, maxNumberOfPullups: 203)
let sergeiBadiuk   = (maxNumberOfPushups: 180, maxNumberOfSquats: 299, maxNumberOfPullups: 164)
 
print("Меня зовут Эрик Давидыч и я могу:\n" +
      "  отжаться \(erikDavidovich.maxNumberOfPushups) раз,\n" +
      "  присесть \(erikDavidovich.1) раз,\n" +
      "  подтянуться \(erikDavidovich.2) раз.")

var difference = (maxNumberOfPushups: 
                    erikDavidovich.maxNumberOfPushups - sergeiBadiuk.maxNumberOfPushups,
                  maxNumberOfSquats: 
                    erikDavidovich.maxNumberOfSquats - sergeiBadiuk.maxNumberOfSquats,
                  maxNumberOfPullups: 
                    erikDavidovich.maxNumberOfPullups - sergeiBadiuk.maxNumberOfPullups)
print("А это\n" +
      "  на \(difference.maxNumberOfPushups) раз больше по отжиманиям,\n" +
      "  на \(difference.maxNumberOfSquats) раз больше по приседаниям\n" +
      "  и на \(difference.maxNumberOfPullups) раз больше по подтягиваниям,\n" +
      "чем у моего друга Сергея Бадюка. :)"
)
