# Set

Set was een van de opdrachten van de course Develop an iOS Application van de minor Mobile Application Development aan de Hogeschool van Arnhem en Nijmegen, editie najaar 2018. De opdracht is afkomstig uit de [course](https://itunes.apple.com/nl/podcast/developing-ios-11-apps-with-swift/id1315130780?mt=2) `Developing iOS 11 Apps with Swift` van Paul Hegarty. 

------

Set was one of the assignments of the course Development of an iOS application of the minor Mobile Application Development at the HAN University of Applied Sciences, edition fall 2018. The assignment comes from the [course](https://itunes.apple.com/nl/podcast/developing-ios-11-apps-with-swift/id1315130780?mt=2) `Developing iOS 11 Apps with Swift` by Paul Hegarty.

## Requirements

|      | Requirement                                                  | Grade |
| ---- | ------------------------------------------------------------ | ----- |
| A    | Implementeer een singleplayer Set game.                      | 0.5   |
| B    | Zorg er voor dat er op het scherm minimaal 24 Set-kaarten kunnen. Alle kaarten staan altijd met de symbolen omhoog in Set. | 0.5   |
| C    | Deel 12 kaarten aan het begin van het spel. De kaarten kunnen overal op het scherm verschijnen (d.w.z. ze hoeven niet bovenaan of onderaan uitgelijnd te zijn of zoiets, ze kunnen worden verspreid om te starten als je dat wilt), maar mogen elkaar niet overlappen. | 0.5   |
| D    | Je hebt ook een "Deel 3 kaarten"-knop nodig (volgens de regels van Set). | 0.5   |
| E    | Sta de gebruiker toe om kaarten te selecteren om te proberen als een set te matchen door de kaarten aan te raken. Het is aan jou hoe je 'selectie' in de UI wilt weergeven. Zie Tips hieronder voor enkele ideeën. Ondersteun ook "deselectie" (maar alleen wanneer momenteel slechts 1 of 2 (niet 3) kaarten zijn geselecteerd). | 0.5   |
| F    | Nadat 3 kaarten zijn geselecteerd, moet je aangeven of die 3 kaarten een overeenkomst of een mismatch zijn (per stelregels). Je kunt dit bijvoorbeeld doen met kleuren of een eigen keuze, maar het moet voor de gebruiker duidelijk zijn of de 3 geselecteerde kaarten een set zijn of niet. | 0.5   |
| G    | Wanneer een kaart is gekozen en er al 3 niet-overeenkomende set-kaarten zijn geselecteerd, deselecteert je die 3 niet-overeenkomende kaarten en selecteert je vervolgens de gekozen kaart. | 0.5   |
| H    | Volgens de regels van Set: wanneer een kaart is gekozen en er al 3 bijpassende Set-kaarten zijn geselecteerd, vervang dan die 3 bijpassende Set-kaarten door nieuwe uit de stapel met 81 Set-kaarten. Als het kaartspel leeg is, kunnen gekoppelde kaarten niet worden vervangen, maar deze moeten in de gebruikersinterface worden verborgen. Als de kaart die werd gekozen één van de drie overeenkomende kaarten was, dan zou er geen kaart geselecteerd moeten worden (omdat de geselecteerde kaart werd vervangen of niet meer zichtbaar was in de gebruikersinterface). | 0.5   |
| I    | Wanneer op de knop "Deel 3 kaarten" wordt gedrukt a) vervangt je de geselecteerde kaarten als ze een match zijn of b) voeg je 3 kaarten toe aan het spel. | 0.5   |
| J    | De knop "Deel 3 kaarten" moet worden uitgeschakeld als er a) geen kaarten meer in het set-deck staan of b) er geen ruimte meer is in de gebruikersinterface om nog 3 kaarten te passen (houd er rekening mee dat er altijd ruimte is voor 3 extra kaarten als de 3 momenteel -gekozen kaarten komen overeen, aangezien je ze vervangt). | 0.5   |
| K    | In plaats van de setkaarten in de klassieke vorm te tekenen (we doen dat volgende week), gebruiken we deze drie tekens ▲ ● ■ en gebruiken kenmerken in NSAttributedString om ze op de juiste manier te tekenen (bijvoorbeeld kleuren en arcering). Op die manier kunnen je kaarten gewoon UIButtons zijn. Zie de Tips voor enkele suggesties voor het weergeven van de verschillende Set-kaarten. | 0.5   |
| L    | Maak gebruik van een methode die gebruik maakt van een closure als argument op zinvol onderdeel in je applicatie. Je kunt er geen gebruiken die in de les werd getoond. | 0.5   |
| M    | Gebruik een enum als een zinvol onderdeel van uw oplossing.  | 0.5   |
| N    | Voeg een zinvolle uitbreiding toe aan een bepaalde data structure als een zinvol onderdeel van je applicatie. Je kunt er geen gebruiken die in de les werd getoond. | 0.5   |
| O    | Je gebruikersinterface moet mooi zijn ingedeeld en er goed uitzien (tenminste in portretmodus, bij voorkeur ook in landschap, maar niet verplicht) op elk iPhone 7 of hoger apparaat. Dit betekent dat je een eenvoudige Autolayout moet doen met stapelweergaven. | 0.5   |
| P    | Zoals je voor Concentration hebt gedaan, moet je een knop voor een nieuw spel hebben en de score in de gebruikersinterface laten zien. Het is aan jou hoe je je Set-game scoort. Je kunt bijvoorbeeld 3 punten geven voor een overeenkomst en -5 voor een mismatch en misschien zelfs -1 voor een deselectie. Misschien worden er minder punten gescoord, afhankelijk van het aantal kaarten op de tafel (dat wil zeggen hoeveel keer Deal 3 More Cards is aangeraakt). Wat je ook het beste vindt, evalueert hoe goed de speler speelt. | 0.5   |
| Q.   | Refactor de app met goede werkwijzen voor moderne programmering. Dit bevat: <br>- Vijf SOLID principles (Martin, 2017) - Coupling and Cohesion (Beck & Diel, 2011) - Design Patterns (zie bijv. Ray Wenderlich (<a href="https://store.raywenderlich.com/products/design-patterns-by-tutorials">Link</a>) or Freeman (<a href="https://www.apress.com/gp/book/9781484203958">Link</a>) - Leesbare code. - Goede reflectie op codebeslissingen. | 2.0 |

------

|      | Requirement                                                  | Grade |
| ---- | ------------------------------------------------------------ | ----- |
| A    | Implement a game of solo (i.e. one player) Set.              | 0.5   |
| B    | Have room on the screen for at least 24 Set cards. All cards are always face up in Set. | 0.5   |
| C    | Deal 12 cards only to start. They can appear anywhere on screen (i.e. they don’t have to be aligned at the top or bottom or anything; they can be scattered to start if you want), but should not overlap. | 0.5   |
| D    | You will also need a “Deal 3 More Cards” button (as per the rules of Set). | 0.5   |
| E    | Allow the user to select cards to try to match as a Set by touching on the cards. It is up to you how you want to show “selection” in your UI. See Hints below for some ideas. Also support “deselection” (but when only 1 or 2 (not 3) cards are currently selected). | 0.5   |
| F    | After 3 cards have been selected, you must indicate whether those 3 cards are a match or a mismatch (per Set rules). You can do this with coloration or however you choose, but it should be clear to the user whether the 3 cards they selected match or not. | 0.5   |
| G    | When any card is chosen and there are already 3 non-matching Set cards selected, deselect those 3 non-matching cards and then select the chosen card. | 0.5   |
| H    | As per the rules of Set, when any card is chosen and there are already 3 matching Set cards selected, replace those 3 matching Set cards with new ones from the deck of 81 Set cards (again, see Set rules for what’s in a Set deck). If the deck is empty then matched cards can’t be replaced, but they should be hidden in the UI. If the card that was chosen was one of the 3 matching cards, then no card should be selected (since the selected card was either replaced or is no longer visible in the UI). | 0.5   |
| I    | When the Deal 3 More Cards button is pressed either a) replace the selected cards if they are a match or b) add 3 cards to the game. | 0.5   |
| J    | The Deal 3 More Cards button should be disabled if there are a) no more cards in the Set deck or b) no more room in the UI to fit 3 more cards (note that there is always room for 3 more cards if the 3 currently-selected cards are a match since you replace them). | 0.5   |
| K    | Instead of drawing the Set cards in the classic form (we’ll do that next week), we’ll use these three characters ▲ ● ■ and use attributes in NSAttributedString to draw them appropriately (i.e. colors and shading). That way your cards can just be UIButtons. See the Hints for some suggestions for how to show the various Set cards. | 0.5   |
| L    | Use a method that takes a closure as an argument as a meaningful part of your solution. You cannot use one that was shown in lecture. | 0.5   |
| M    | Use an enum as a meaningful part of your solution.           | 0.5   |
| N    | Add a sensible extension to some data structure as a meaningful part of your solution. You cannot use one that was shown in lecture. | 0.5   |
| O    | Your UI should be nicely laid out and look good (at least in portrait mode, preferably in landscape as well, though not required) on any iPhone 7 or later device. This means you’ll need to do some simple Autolayout with stack views. | 0.5   |
| P    | Like you did for Concentration, you must have a New Game button and show the Score in the UI. It is up to you how you want to score your Set game. For example, you could give 3 points for a match and -5 for a mismatch and maybe even -1 for a deselection. Perhaps fewer points are scored depending on how many cards are on the table (i.e. how many times Deal 3 More Cards has been touched). Whatever you think best evaluates how well the player is playing. | 0.5   |
| Q    | Refactor the app to include good practices for modern programming.  This includes: - Five SOLID principles (Martin, 2017) - Coupling and Cohesion (Beck & Diel, 2011) - Design Patterns (Freeman, 2015; Green & Strawn, 2018)  - Readable code (without the need for comments) - Being able to reflect on good and less good (smelly) code decisions. | 2.0   |

