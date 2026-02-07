// List of common English idioms and phrases with Hindi meanings and examples
const List<Map<String, String>> idiomsList = [
  {
    'idiom': 'A piece of cake',
    'meaning': 'Something very easy to do.',
    'hindi': 'बहुत आसान काम',
    'example': 'The exam was a piece of cake for him.',
  },
  {
    'idiom': 'Bite the bullet',
    'meaning': 'To accept something difficult or unpleasant.',
    'hindi': 'मुसीबत का सामना करना',
    'example': 'She decided to bite the bullet and tell him the truth.',
  },
  {
    'idiom': 'Break a leg',
    'meaning':
        'A way to wish someone good luck, especially before a performance.',
    'hindi': 'शुभकामनाएं (विशेषकर प्रदर्शन से पहले)',
    'example': 'Break a leg at your recital tonight!',
  },
  {
    'idiom': 'Call it a day',
    'meaning': 'To stop working on something.',
    'hindi': 'आज का काम बंद करना',
    'example': 'We’ve been working for ten hours; let’s call it a day.',
  },
  {
    'idiom': 'Cutting corners',
    'meaning': 'Doing something poorly to save time or money.',
    'hindi': 'कामचोरी करना या पैसे बचाने के लिए गुणवत्ता से समझौता करना',
    'example':
        'The builder cut corners on the renovation, and now the roof leaks.',
  },
  {
    'idiom': 'Get out of hand',
    'meaning': 'To get out of control.',
    'hindi': 'नियंत्रण से बाहर होना',
    'example': 'The party got out of hand when too many people showed up.',
  },
  {
    'idiom': 'Hit the sack',
    'meaning': 'To go to sleep.',
    'hindi': 'सोने जाना',
    'example': 'I’m really tired, I think I’ll hit the sack.',
  },
  {
    'idiom': 'It’s not rocket science',
    'meaning': 'It’s not that difficult to understand.',
    'hindi': 'यह कोई बहुत कठिन काम नहीं है',
    'example': 'Just follow the instructions; it’s not rocket science.',
  },
  {
    'idiom': 'Let someone off the hook',
    'meaning': 'To allow someone to escape punishment.',
    'hindi': 'सजा से बचा लेना',
    'example':
        'The teacher let him off the hook this time for not doing his homework.',
  },
  {
    'idiom': 'No pain, no gain',
    'meaning': 'You have to work hard for what you want.',
    'hindi': 'बिना सेवा मेवा नहीं मिलता',
    'example': 'I’ve been training hard at the gym. No pain, no gain!',
  },
  {
    'idiom': 'On the ball',
    'meaning': 'Being very prepared or efficient.',
    'hindi': 'सतर्क और कुशल होना',
    'example': 'She’s really on the ball and always meets her deadlines.',
  },
  {
    'idiom': 'Once in a blue moon',
    'meaning': 'Something that happens very rarely.',
    'hindi': 'ईद का चाँद होना (बहुत कम होने वाला)',
    'example': 'I only see my old school friends once in a blue moon.',
  },
  {
    'idiom': 'Pull someone’s leg',
    'meaning': 'To joke with someone.',
    'hindi': 'टांग खींचना (मजाक करना)',
    'example': 'Relax, I’m just pulling your leg!',
  },
  {
    'idiom': 'Speak of the devil',
    'meaning': 'When the person you were talking about shows up.',
    'hindi': 'नाम लिया और शैतान हाजिर',
    'example': 'Speak of the devil! We were just talking about you.',
  },
  {
    'idiom': 'The best of both worlds',
    'meaning': 'An ideal situation.',
    'hindi': 'दोनों हाथों में लड्डू होना',
    'example': 'By working from home, she has the best of both worlds.',
  },
  {
    'idiom': 'Under the weather',
    'meaning': 'Feeling slightly ill.',
    'hindi': 'तबीयत खराब होना',
    'example': 'I’m feeling a bit under the weather today.',
  },
  {
    'idiom': 'Wrap your head around something',
    'meaning': 'To understand something complicated.',
    'hindi': 'किसी कठिन बात को समझना',
    'example': 'I’m still trying to wrap my head around the new software.',
  },
  {
    'idiom': 'Better late than never',
    'meaning': 'Better to arrive or do something late than not at all.',
    'hindi': 'देर आए दुरुस्त आए',
    'example': 'The package finally arrived, better late than never.',
  },
  {
    'idiom': 'Easy does it',
    'meaning': 'Slow down or be careful.',
    'hindi': 'धीरे और सावधानी से',
    'example': 'Easy does it, that vase is very fragile.',
  },
  {
    'idiom': 'Get your act together',
    'meaning': 'Work better or leave.',
    'hindi': 'ढंग से काम करना शुरू करना',
    'example':
        'You need to get your act together if you want to keep this job.',
  },
  {
    'idiom': 'A blessing in disguise',
    'meaning': 'An apparent misfortune that eventually has good results.',
    'hindi': 'छुपा हुआ वरदान',
    'example':
        'Losing that job was a blessing in disguise; I found a much better one.',
  },
  {
    'idiom': 'A dime a dozen',
    'meaning': 'Very common and easy to find.',
    'hindi': 'बहुत आम',
    'example': 'Mobile phones are a dime a dozen now.',
  },
  {
    'idiom': 'Add fuel to the fire',
    'meaning': 'To make a bad situation worse.',
    'hindi': 'आग में घी डालना',
    'example': 'His comments only added fuel to the fire during the argument.',
  },
  {
    'idiom': 'At arms length',
    'meaning': 'Avoid becoming too friendly.',
    'hindi': 'दूर रखना',
    'example': 'He kept all his competitors at arms length.',
  },
  {
    'idiom': 'At the eleventh hour',
    'meaning': 'At the last moment.',
    'hindi': 'अंतिम समय में',
    'example': 'She submitted her project at the eleventh hour.',
  },
  {
    'idiom': 'Back to the drawing board',
    'meaning': 'To start over again because a plan has failed.',
    'hindi': 'फिर से शुरू करना',
    'example':
        'The experiment didnt yield the expected results, so its back to the drawing board.',
  },
  {
    'idiom': 'Bag and baggage',
    'meaning': 'With all ones belongings.',
    'hindi': 'बोरिया-बिस्तर समेत',
    'example': 'The tenants left the apartment, bag and baggage.',
  },
  {
    'idiom': 'Beat about the bush',
    'meaning': 'Avoid saying what you mean directly.',
    'hindi': 'बात को घुमा-फिराकर कहना',
    'example': 'Stop beating around the bush and tell me the truth.',
  },
  {
    'idiom': 'Beat black and blue',
    'meaning': 'Beat mercilessly.',
    'hindi': 'अत्यधिक पिटाई करना',
    'example': 'The robbers beat him black and blue.',
  },
  {
    'idiom': 'A white elephant',
    'meaning': 'An expensive but useless possession.',
    'hindi': 'महंगा परंतु बेकार',
    'example':
        'The new factory turned out to be a white elephant for the company.',
  },
  {
    'idiom': 'Bell the cat',
    'meaning': 'To take the first step at personal risk.',
    'hindi': 'जोखिम उठाना',
    'example':
        'Everyone was afraid to complain, but finally, he decided to bell the cat.',
  },
  {
    'idiom': 'Bite the dust',
    'meaning': 'To be defeated.',
    'hindi': 'पराजित होना',
    'example':
        'The champion made his opponent bite the dust in the final round.',
  },
  {
    'idiom': 'Black sheep',
    'meaning': 'A person who is regarded as a disgrace to his family/team.',
    'hindi': 'परिवार या टीम के लिए शर्मिंदगी का कारण',
    'example': 'He was considered the black sheep of the family.',
  },
  {
    'idiom': 'Blind alley',
    'meaning': 'A situation in which no further progress can be made.',
    'hindi': 'ऐसा कार्य जिसमें आगे प्रगति संभव नहीं',
    'example': 'The investigation led them into a blind alley.',
  },
  {
    'idiom': 'Blow ones own trumpet',
    'meaning': 'To praise oneself.',
    'hindi': 'अपनी प्रशंसा करना',
    'example': 'He is always blowing his own trumpet about his achievements.',
  },
  {
    'idiom': 'Bolt from the blue',
    'meaning': 'An unexpected problem.',
    'hindi': 'आकस्मिक विपत्ति',
    'example':
        'The news of his sudden resignation came as a bolt from the blue.',
  },
  {
    'idiom': 'Bone of contention',
    'meaning': 'Subject of a dispute.',
    'hindi': 'झगड़े की वस्तु या कारण',
    'example':
        'The ancestral property became a bone of contention between the brothers.',
  },
  {
    'idiom': 'Bosom friend',
    'meaning': 'A very close friend.',
    'hindi': 'जिगरी दोस्त',
    'example': 'They have been bosom friends since childhood.',
  },
  {
    'idiom': 'Break the ice',
    'meaning': 'To initiate conversation.',
    'hindi': 'बातचीत की शुरुआत करना',
    'example': 'He told a joke to break the ice at the party.',
  },
  {
    'idiom': 'Burn the midnight oil',
    'meaning': 'Work late into the night.',
    'hindi': 'देर रात तक मेहनत करना',
    'example': 'She burned the midnight oil to study for her exams.',
  },
  {
    'idiom': 'Bury the hatchet',
    'meaning': 'To end enmity/hostility.',
    'hindi': 'दुश्मनी खत्म करना',
    'example': 'After years of feuding, they decided to bury the hatchet.',
  },
  {
    'idiom': 'By hook or by crook',
    'meaning': 'By any means necessary.',
    'hindi': 'किसी भी तरह से',
    'example': 'He wanted to win the competition by hook or by crook.',
  },
  {
    'idiom': 'By leaps and bounds',
    'meaning': 'At a rapid pace.',
    'hindi': 'दिन दूनी रात चौगुनी',
    'example': 'His business grew by leaps and bounds.',
  },
  {
    'idiom': 'Call a spade a spade',
    'meaning': 'To speak plainly and directly.',
    'hindi': 'स्पष्ट बात कहना',
    'example':
        'She is known for calling a spade a spade, even if its uncomfortable.',
  },
  {
    'idiom': 'Castles in the air',
    'meaning': 'Daydream/unrealistic plans for the future.',
    'hindi': 'हवाई किला बनाना',
    'example':
        'He spends his time building castles in the air instead of working.',
  },
  {
    'idiom': 'Caught red-handed',
    'meaning': 'Discovered in the act of doing something wrong.',
    'hindi': 'रंगे हाथ पकड़ना',
    'example': 'The thief was caught red-handed stealing the jewels.',
  },
  {
    'idiom': 'Chicken-hearted',
    'meaning': 'Lacking courage/cowardly.',
    'hindi': 'कायर',
    'example': 'He was too chicken-hearted to confront his boss.',
  },
  {
    'idiom': 'Cock and bull story',
    'meaning': 'A concocted story.',
    'hindi': 'मनगढ़ंत कहानी',
    'example': 'Dont believe him; hes always telling cock and bull stories.',
  },
  {
    'idiom': 'Cold shoulder',
    'meaning': 'To ignore or treat someone with indifference.',
    'hindi': 'नजरअंदाज करना',
    'example': 'She gave him the cold shoulder after their argument.',
  },
  {
    'idiom': 'Crocodile tears',
    'meaning': 'A false display of grief.',
    'hindi': 'दिखावटी आंसू',
    'example': 'Dont be fooled by her crocodile tears; shes not genuinely sad.',
  },
  {
    'idiom': 'Cry for the moon',
    'meaning': 'To desire the unattainable.',
    'hindi': 'किसी असंभव वस्तु की कामना करना',
    'example': 'Wishing for a perfect world is like crying for the moon.',
  },
  {
    'idiom': 'Cry over spilled milk',
    'meaning': 'Complain about something that cannot be undone.',
    'hindi': 'बीती बात पर पछताना',
    'example': 'Its no use crying over spilled milk; whats done is done.',
  },
  {
    'idiom': 'Curry favour',
    'meaning': 'To seek to win favour by gifts or flattery.',
    'hindi': 'छल से मदद पाना',
    'example':
        'He tried to curry favour with his teacher by bringing her gifts.',
  },
  {
    'idiom': 'Dark horse',
    'meaning': 'An unexpected winner.',
    'hindi': 'अप्रत्याशित विजेता',
    'example':
        'The new candidate turned out to be a dark horse in the elections.',
  },
  {
    'idiom': 'Die in harness',
    'meaning': 'Die while in service.',
    'hindi': 'अपने कार्यकाल के दौरान ही मृत्यु होना',
    'example':
        'The dedicated scientist died in harness, working until his last breath.',
  },
  {
    'idiom': 'Donkeys years',
    'meaning': 'A very long time.',
    'hindi': 'बहुत लंबा समय',
    'example': 'I havent seen him in donkeys years.',
  },
  {
    'idiom': 'Face the music',
    'meaning': 'To confront the consequences of ones actions.',
    'hindi': 'परिणाम भुगतना',
    'example': 'You have to face the music for your mistakes.',
  },
  {
    'idiom': 'Fair weather friend',
    'meaning': 'Selfish friend who are with us only in comfortable situations.',
    'hindi': 'मुसीबत में साथ न देने वाला मित्र',
    'example': 'He proved to be a fair-weather friend when I needed him most.',
  },
  {
    'idiom': 'Feather in ones cap',
    'meaning': 'A new and additional distinction/achievement.',
    'hindi': 'सम्मान की नई उपाधि',
    'example': 'Winning the national championship was a feather in his cap.',
  },
  {
    'idiom': 'Fish out of water',
    'meaning': 'Out of ones usual and comfortable place.',
    'hindi': 'असहज स्थिति में होना',
    'example': 'He felt like a fish out of water at the formal dinner party.',
  },
  {
    'idiom': 'Forty winks',
    'meaning': 'A nap.',
    'hindi': 'झपकी',
    'example': 'Im going to catch forty winks before dinner.',
  },
  {
    'idiom': 'Get cold feet',
    'meaning': 'To feel nervous or scared.',
    'hindi': 'डरना',
    'example': 'He got cold feet before his job interview.',
  },
  {
    'idiom': 'Get into hot water',
    'meaning': 'To get into trouble.',
    'hindi': 'परेशानी में फंसना',
    'example': 'He got into hot water for missing the deadline.',
  },
  {
    'idiom': 'Get off scot-free',
    'meaning': 'To escape without punishment.',
    'hindi': 'बिना सजा के निकल जाना',
    'example': 'The criminal got off scot-free due to lack of evidence.',
  },
  {
    'idiom': 'Go the extra mile',
    'meaning': 'To make additional effort or go beyond what is required.',
    'hindi': 'अतिरिक्त प्रयास करना',
    'example': 'She always goes the extra mile to help her colleagues.',
  },
  {
    'idiom': 'Hit the nail on the head',
    'meaning':
        'To describe something accurately or to do something exactly right.',
    'hindi': 'बिल्कुल सही बात कहना',
    'example': 'You really hit the nail on the head with that explanation.',
  },
  {
    'idiom': 'In a nutshell',
    'meaning': 'Briefly and concisely.',
    'hindi': 'संक्षेप में',
    'example': 'In a nutshell, the project was a complete success.',
  },
  {
    'idiom': 'Jump on the bandwagon',
    'meaning': 'To join or support something that is already popular.',
    'hindi': 'लोकप्रिय चीज़ में शामिल होना',
    'example':
        'Many companies are jumping on the bandwagon of sustainable practices.',
  },
  {
    'idiom': 'Kick the bucket',
    'meaning': 'To die.',
    'hindi': 'मर जाना',
    'example': 'He lived a long life before he kicked the bucket.',
  },
  {
    'idiom': 'Kill two birds with one stone',
    'meaning': 'Achieve two things at once.',
    'hindi': 'एक तीर से दो निशाने',
    'example': 'I killed two birds with one stone by shopping while traveling.',
  },
  {
    'idiom': 'Let the cat out of the bag',
    'meaning': 'To reveal a secret.',
    'hindi': 'रहस्य उजागर करना',
    'example':
        'I accidentally let the cat out of the bag about the surprise party.',
  },
  {
    'idiom': 'Make a beeline',
    'meaning': 'Go quickly and directly to somewhere.',
    'hindi': 'तेज़ी से सीधे जाना',
    'example':
        'As soon as the doors opened, everyone made a beeline for the sales section.',
  },
  {
    'idiom': 'Make ends meet',
    'meaning': 'Live within ones means.',
    'hindi': 'सीमित साधनों में जीना',
    'example': 'Its difficult to make ends meet with such a low salary.',
  },
  {
    'idiom': 'Smell a rat',
    'meaning': 'To suspect foul dealings.',
    'hindi': 'दाल में कुछ काला होना',
    'example': 'I smell a rat; they are being unusually nice to me.',
  },
  {
    'idiom': 'Snake in the grass',
    'meaning': 'A hidden enemy.',
    'hindi': 'छिपा हुआ दुश्मन',
    'example': 'He later realized his trusted friend was a snake in the grass.',
  },
  {
    'idiom': 'Through thick and thin',
    'meaning': 'In good times and bad, or through all circumstances.',
    'hindi': 'अच्छे और बुरे समय में',
    'example': 'She stood by him through thick and thin.',
  },
  {
    'idiom': 'Up in the air',
    'meaning': 'Uncertain or undecided.',
    'hindi': 'अनिश्चित या अस्थिर',
    'example': 'The date for the meeting is still up in the air.',
  },
  {
    'idiom': 'Vanish into thin air',
    'meaning': 'To disappear suddenly or without a trace.',
    'hindi': 'अचानक गायब हो जाना',
    'example':
        'The thief vanished into thin air before anyone could catch him.',
  },
  {
    'idiom': 'A wild goose chase',
    'meaning': 'A fruitless or hopeless pursuit.',
    'hindi': 'निरर्थक खोज',
    'example':
        'Searching for that old book turned out to be a wild goose chase.',
  },
  {
    'idiom': 'At the drop of a hat',
    'meaning': 'Instantly; without any delay.',
    'hindi': 'तुरंत',
    'example': 'He is always ready to travel at the drop of a hat.',
  },
  {
    'idiom': 'Ball is in your court',
    'meaning': 'It is up to you to makes the next move or decision.',
    'hindi': 'अब निर्णय तुम्हारे हाथ में है',
    'example': 'Ive offered you the job, now the ball is in your court.',
  },
  {
    'idiom': 'Barking up the wrong tree',
    'meaning': 'Looking in the wrong place or accusing the wrong person.',
    'hindi': 'गलत दिशा में प्रयास करना',
    'example': 'If you think he did it, you are barking up the wrong tree.',
  },
  {
    'idiom': 'Beat around the bush',
    'meaning': 'Avoid talking about what is important.',
    'hindi': 'घुमा-फिराकर बात करना',
    'example': 'Stop beating around the bush and get to the point.',
  },
  {
    'idiom': 'Cry wolf',
    'meaning': 'To give a false alarm.',
    'hindi': 'झूठी चेतावनी देना',
    'example':
        'If you keep crying wolf, no one will help you when you really need it.',
  },
  {
    'idiom': 'Greek to me',
    'meaning': 'Something that is difficult to understand.',
    'hindi': 'समझ से बाहर होना',
    'example': 'This chemical formula is all Greek to me.',
  },
  {
    'idiom': 'Last straw',
    'meaning': 'The final problem in a series of problems.',
    'hindi': 'धैर्य की अंतिम सीमा',
    'example': 'When he missed the meeting, that was the last straw.',
  },
  {
    'idiom': 'Miss the boat',
    'meaning': 'To miss an opportunity.',
    'hindi': 'अवसर खो देना',
    'example': 'If you dont apply now, you will miss the boat.',
  },
  {
    'idiom': 'Seeing eye to eye',
    'meaning': 'Agreeing with someone.',
    'hindi': 'पूरी तरह सहमत होना',
    'example': 'My parents dont always see eye to eye with me.',
  },
  {
    'idiom': 'Sit on the fence',
    'meaning': 'To be undecided.',
    'hindi': 'किसी का पक्ष न लेना (तटस्थ रहना)',
    'example': 'You cant sit on the fence forever; you need to choose a side.',
  },
  {
    'idiom': 'Spill the beans',
    'meaning': 'To reveal secret information.',
    'hindi': 'रहस्य खोलना',
    'example': 'Who spilled the beans about the surprise party?',
  },
  {
    'idiom': 'Take with a grain of salt',
    'meaning': 'To not believe something completely.',
    'hindi': 'पूरी तरह से विश्वास न करना (संदेह के साथ सुनना)',
    'example': 'Take his stories with a grain of salt; he tends to exaggerate.',
  },
  {
    'idiom': 'A bird in the hand is worth two in the bush',
    'meaning': 'What you have is worth more than what you might have later.',
    'hindi': 'नौ नकद न तेरह उधार',
    'example':
        'He kept his current job instead of waiting for a better one; a bird in the hand is worth two in the bush.',
  },
  {
    'idiom': 'Kill time',
    'meaning': 'To do something while waiting.',
    'hindi': 'समय काटना',
    'example': 'I played games on my phone to kill time at the airport.',
  },
  {
    'idiom': 'Loose cannon',
    'meaning': 'An unpredictable person who may cause damage.',
    'hindi': 'अनियंत्रित और खतरनाक व्यक्ति',
    'example': 'His temper makes him a bit of a loose cannon.',
  },
  {
    'idiom': 'Off the hook',
    'meaning': 'Out of trouble or free from an obligation.',
    'hindi': 'मुसीबत से बचना',
    'example': 'Since the others confessed, he was off the hook.',
  },
  {
    'idiom': 'See pink elephants',
    'meaning': 'To have hallucinations due to intoxication.',
    'hindi': 'नशे में धुत्त होना (भ्रम होना)',
    'example': 'He was so drunk he started seeing pink elephants.',
  },
  {
    'idiom': 'Keep your chin up',
    'meaning': 'Stay positive in a tough situation.',
    'hindi': 'हिम्मत मत हारो',
    'example': 'Keep your chin up; things will get better soon.',
  },
];
