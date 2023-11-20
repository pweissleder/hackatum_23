# hackatum_23

**1st place in the HelloFresh Challange at HackaTUM 2023**

## Inspiration

As we thought about intuitive ways of entering sometimes endless lists of dietary requirements and preferences, we recognized that the best solution would be to have none at all! As most of us have already entered all the required data in one or another application, we do not need to repeat that process.

## What it does

TailoredTaste utilizes the data you have already entered in other applications. The information is automatically integrated and your personal requirements and preferences are updated. Based on those, TailoredTaste recommends a list of recipes to the users. The users can conveniently browse through them with appealing visualizations through pictures and short videos. With a long press, more detailed information is shown including information about ingredients, nutrition, and cooking instructions. If the users like a recipe, it can be added to their favorite list by double-tapping the video. They can access their favorites and additional information on the home screen.

If it's time for dinner, they can conveniently choose a fitting recipe from their favorites list located on the home screen. After they have eaten their meal, it can be marked as such and all connected nutritional data is exported to their external integrations like Apple Health. Over are the days of QR scanning and weighting. 🥳

We also include a preferences page to give the users the ability to check and modify their information in a convenient way. This is also the place to manage their 3rd party integrations into TailoredTaste.

BTW: All preferences and personal information are saved locally on the device atm. !

## How we built it

As we wanted to keep the complexity of the system as low as possible, we opted for a one-app solution without additional supporting infrastructure. The choice for a native iOS app with Swift and SwiftUI was based on the prior experience of the team and the fact that we can utilize Apple's extensive Health application.

We focused on the most essential user interfaces and worked on achieving a working MVP as soon as possible, which we were able to achieve by Saturday afternoon.

From there, we expanded the app with additional features and improved design and recommendations.

Challenges we ran into

One challenge was to come up with a universal model for dietary requirements and how to implement the recommendation logic. Fortunately, we were able to overcome these challenges as a team!

Another challenge we faced was and still is the limited testing scope for health-related data in Apple Heathkit as only accredited health institutions and Doctors can enter new information like allergies.

Last but not least Xcode itself.🥲 We look at you, project files !!!

## Accomplishments that we're proud of

One of our teammates built his first Swift native iOS application during this hackathon! Furthermore, we found a novel, open-minded solution to a challenging problem statement.

## What we learned

We improved our technical skills by gaining first or additional experience in native iOS development and the Apple Health application. Moreover, we expanded our experience in business development, pitching ideas, and rapid prototyping.

## What's next for TailoredTaste

The integrations we made are only the beginning. We could imagine integrating additional information like family, living situations, and sports & nutrition apps. Sky is the limit!

To make the gap to the HelloFresh sales model we propose to implement a week planner where the user selects the recipes for the next HelloFresh package they wish to order. An integration of fitness apps with training plans and additional calendar information could enable individual recommendations by the day, adapted to the predicted daily dietary requirements of the user. This would appeal to new fitness-focused customer groups and work great in combination with other implemented features like exporting your data.

An ML-supported recommendations system could also offer the potential for further improvement of customer satisfaction and product-customer fit.


# Reference s& Resourses

### Cooking Video inApp:
All videos which are used are from Chris Washington, former known as VeganeWunder. Please check him out <a href="[https://www.flaticon.com/free-icons/time](https://youtube.com/@VeganeWunder?si=bQrKGsr9NDuHEzD3)" title="Youtube - Chris Washington">

### Code
We used the [github repo](https://github.com/GireshD/TiktokSwiftUI) as a base for the vertical scrolling. 

For teh recipies we utilized the [spoonacular](https://spoonacular.com) API, but adapted it manually fit our purposes. 
Loading bars are inspired by [Amos Gyamfi](https://cindori.com/developer/swiftui-animation-loading)


### Icon Credits of Pitchdeck: 
<a href="https://www.flaticon.com/free-icons/time" title="time icons">Time icons created by Freepik - Flaticon</a>

<a href="https://www.flaticon.com/free-icons/kpi" title="kpi icons">Kpi icons created by Freepik - Flaticon</a>

<a href="https://www.flaticon.com/free-icons/satisfaction" title="satisfaction icons">Satisfaction icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/survey" title="survey icons">Survey icons created by Freepik - Flaticon</a>


<div> Icons made by <a href="https://www.freepik.com" title="Freepik"> Freepik </a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com'</a></div>


<a href="https://www.flaticon.com/free-icons/heart" title="heart icons">Heart icons created by Freepik - Flaticon</a>

<a href="https://www.flaticon.com/free-icons/data-integration" title="data integration icons">Data integration icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/prediction" title="prediction icons">Prediction icons created by Darius Dan - Flaticon</a>

<a href="https://www.flaticon.com/free-icons/gluten-free" title="gluten free icons">Gluten free icons created by Freepik - Flaticon</a>
<div> Icons made by <a href="https://www.freepik.com" title="Freepik"> Freepik </a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com'</a></div>
<a href="https://www.flaticon.com/free-icons/control" title="control icons">Control icons created by Freepik - Flaticon</a>


<a href="https://www.flaticon.com/free-icons/simplify" title="simplify icons">Simplify icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Freepik - Flaticon</a>

[Strava Logo](https://www.strava.com/mobile)
https://developer.apple.com/health-fitness/ Apple Health FAQ and Troubleshooting – MyFitnessPal Help
Fitbit-App-Logo transparente PNG - StickPNG  Image by svstudioart on Freepik

Disclamer: Modified readme in comparison to the submission version(see submission_hackatum) and added presentation material
