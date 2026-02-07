const List<Map<String, dynamic>> grammarRules = [
  {
    'title': 'Tenses (Present Tense)',
    'hindiTitle': 'काल (वर्तमान काल)',
    'rules': [
      {
        'rule':
            'Simple Present: Subject + V1 (s/es) + Object. Use for habits, facts, universal truths.',
        'hindiRule':
            'साधारण वर्तमान: कर्ता + क्रिया (s/es) + कर्म। आदतों, तथ्यों और सार्वभौमिक सत्य के लिए प्रयोग करें।',
        'example': 'The sun rises in the east. (सूर्य पूर्व में उगता है।)',
      },
      {
        'rule':
            'Present Continuous: Subject + is/am/are + V1 + ing + Object. Use for actions happening now.',
        'hindiRule':
            'वर्तमान निरंतर: कर्ता + is/am/are + क्रिया + ing + कर्म। अभी हो रही क्रियाओं के लिए प्रयोग करें।',
        'example': 'She is reading a book. (वह किताब पढ़ रही है।)',
      },
      {
        'rule':
            'Present Perfect: Subject + has/have + V3 + Object. Use for actions just completed.',
        'hindiRule':
            'वर्तमान पूर्ण: कर्ता + has/have + क्रिया (तीसरा रूप) + कर्म। अभी पूर्ण हुई क्रियाओं के लिए प्रयोग करें।',
        'example': 'I have finished my work. (मैंने अपना काम पूरा कर लिया है।)',
      },
      {
        'rule':
            'Present Perfect Continuous: Subject + has/have + been + V1 + ing + Object. Use for actions started in past and continuing now.',
        'hindiRule':
            'वर्तमान पूर्ण निरंतर: कर्ता + has/have + been + क्रिया + ing + कर्म। भूतकाल में शुरू होकर अभी तक चल रही क्रियाओं के लिए।',
        'example':
            'It has been raining since morning. (सुबह से बारिश हो रही है।)',
      },
    ],
    'quiz': [
      {
        'question': 'She _______ to the market every Sunday.',
        'options': ['go', 'going', 'goes', 'gone'],
        'correctAnswer': 'goes',
      },
      {
        'question': 'Look! It _______ snowing now.',
        'options': ['is', 'was', 'are', 'were'],
        'correctAnswer': 'is',
      },
      {
        'question': 'I _______ never seen a ghost.',
        'options': ['has', 'have', 'did', 'was'],
        'correctAnswer': 'have',
      },
      {
        'question': 'They _______ been playing for two hours.',
        'options': ['have', 'has', 'is', 'are'],
        'correctAnswer': 'have',
      },
      {
        'question': 'The earth _______ round the sun.',
        'options': ['revolve', 'revolving', 'revolves', 'revolved'],
        'correctAnswer': 'revolves',
      },
    ],
  },
  {
    'title': 'Tenses (Past Tense)',
    'hindiTitle': 'काल (भूतकाल)',
    'rules': [
      {
        'rule':
            'Simple Past: Subject + V2 + Object. Use for actions completed in the past.',
        'hindiRule':
            'साधारण भूतकाल: कर्ता + क्रिया (दूसरा रूप) + कर्म। भूतकाल में पूर्ण हुई क्रियाओं के लिए।',
        'example': 'He visited Delhi yesterday. (उसने कल दिल्ली का दौरा किया।)',
      },
      {
        'rule':
            'Past Continuous: Subject + was/were + V1 + ing + Object. Use for actions continuing in the past.',
        'hindiRule':
            'भूत निरंतर: कर्ता + was/were + क्रिया + ing + कर्म। भूतकाल में चल रही क्रियाओं के लिए।',
        'example': 'They were playing cricket. (वे क्रिकेट खेल रहे थे।)',
      },
      {
        'rule':
            'Past Perfect: Subject + had + V3 + Object. Use for an action completed before another past action.',
        'hindiRule':
            'पूर्ण भूतकाल: कर्ता + had + क्रिया (तीसरा रूप) + कर्म। किसी अन्य भूतकालीन क्रिया से पहले पूर्ण हुई क्रिया के लिए।',
        'example':
            'The train had left before I reached the station. (मेरे स्टेशन पहुंचने से पहले ट्रेन जा चुकी थी।)',
      },
      {
        'rule':
            'Past Perfect Continuous: Subject + had + been + V1 + ing + Object. Use for actions continuing for a duration in the past.',
        'hindiRule':
            'पूर्ण भूत निरंतर: कर्ता + had + been + क्रिया + ing + कर्म। भूतकाल में किसी अवधि तक चल रही क्रिया के लिए।',
        'example':
            'He had been waiting for two hours when she arrived. (जब वह आई, तो वह दो घंटे से इंतजार कर रहा था।)',
      },
    ],
    'quiz': [
      {
        'question': 'I _______ him yesterday.',
        'options': ['meet', 'met', 'have met', 'meeting'],
        'correctAnswer': 'met',
      },
      {
        'question': 'She _______ cooking when I called.',
        'options': ['is', 'was', 'were', 'has'],
        'correctAnswer': 'was',
      },
      {
        'question': 'The patient _______ died before the doctor came.',
        'options': ['has', 'have', 'had', 'was'],
        'correctAnswer': 'had',
      },
      {
        'question': 'We _______ watching TV all evening.',
        'options': ['was', 'were', 'had been', 'have been'],
        'correctAnswer': 'had been',
      },
      {
        'question': 'Columbus _______ America.',
        'options': ['discover', 'discovered', 'discovering', 'discovers'],
        'correctAnswer': 'discovered',
      },
    ],
  },
  {
    'title': 'Tenses (Future Tense)',
    'hindiTitle': 'काल (भविष्य काल)',
    'rules': [
      {
        'rule':
            'Simple Future: Subject + will/shall + V1 + Object. Use for future actions.',
        'hindiRule':
            'साधारण भविष्य: कर्ता + will/shall + क्रिया + कर्म। भविष्य की क्रियाओं के लिए।',
        'example': 'I will meet you tomorrow. (मैं तुमसे कल मिलूंगा।)',
      },
      {
        'rule':
            'Future Continuous: Subject + will be + V1 + ing + Object. Use for actions continuing in the future.',
        'hindiRule':
            'भविष्य निरंतर: कर्ता + will be + क्रिया + ing + कर्म। भविष्य में जारी रहने वाली क्रियाओं के लिए।',
        'example':
            'At this time tomorrow, I will be flying to London. (कल इस समय, मैं लंदन के लिए उड़ान भर रहा हूँगा।)',
      },
      {
        'rule':
            'Future Perfect: Subject + will have + V3 + Object. Use for actions completed by a future time.',
        'hindiRule':
            'भविष्य पूर्ण: कर्ता + will have + क्रिया (तीसरा रूप) + कर्म। भविष्य में किसी समय तक पूरी होने वाली क्रियाओं के लिए।',
        'example':
            'By next year, I will have graduated. (अगले साल तक, मैं स्नातक हो जाऊंगा।)',
      },
    ],
    'quiz': [
      {
        'question': 'I _______ call you later.',
        'options': ['will', 'am', 'was', 'have'],
        'correctAnswer': 'will',
      },
      {
        'question': 'This time tomorrow, we _______ sitting on the beach.',
        'options': ['will', 'will be', 'are', 'have'],
        'correctAnswer': 'will be',
      },
      {
        'question': 'By 2025, she _______ finished her PhD.',
        'options': ['will have', 'will be', 'has', 'had'],
        'correctAnswer': 'will have',
      },
      {
        'question': 'They _______ probably arrive soon.',
        'options': ['will', 'are', 'have', 'did'],
        'correctAnswer': 'will',
      },
      {
        'question': 'He _______ be waiting for us.',
        'options': ['shall', 'will', 'is', 'was'],
        'correctAnswer': 'will',
      },
    ],
  },
  {
    'title': 'Modals (Auxiliary Verbs)',
    'hindiTitle': 'Modals (सहायक क्रियाएँ)',
    'rules': [
      {
        'rule': 'Can/Could: Ability, Possibility, Permission.',
        'hindiRule':
            'Can/Could: क्षमता, संभावना, अनुमति। (Can - वर्तमान, Could - भूतकाल/विनम्रता)',
        'example': 'I can speak English. / Could you help me?',
      },
      {
        'rule': 'May/Might: Possibility, Permission (Formal).',
        'hindiRule':
            'May/Might: संभावना, अनुमति (औपचारिक)। (May - अधिक संभावना, Might - कम संभावना)',
        'example': 'It may rain today. / May I come in?',
      },
      {
        'rule': 'Must/Have to: Obligation, Necessity.',
        'hindiRule': 'Must/Have to: बाध्यता, आवश्यकता।',
        'example': 'You must follow the rules. / I have to go now.',
      },
      {
        'rule': 'Should/Ought to: Advice, Duty.',
        'hindiRule': 'Should/Ought to: सलाह, कर्तव्य।',
        'example': 'You should see a doctor. / We ought to respect our elders.',
      },
      {
        'rule': 'Will/Would: Determination, Willingness, Habit (Past).',
        'hindiRule': 'Will/Would: दृढ़ संकल्प, इच्छा, आदत (भूतकाल)।',
        'example': 'I will do it. / He would often visit us.',
      },
    ],
    'quiz': [
      {
        'question': '_______ I use your phone?',
        'options': ['May', 'Must', 'Should', 'Will'],
        'correctAnswer': 'May',
      },
      {
        'question': 'You _______ wear a seatbelt while driving.',
        'options': ['can', 'may', 'must', 'might'],
        'correctAnswer': 'must',
      },
      {
        'question': 'I _______ swim when I was five.',
        'options': ['can', 'could', 'may', 'should'],
        'correctAnswer': 'could',
      },
      {
        'question': 'It _______ rain later.',
        'options': ['must', 'should', 'might', 'will'],
        'correctAnswer': 'might',
      },
      {
        'question': 'You _______ apologize for your mistake.',
        'options': ['can', 'may', 'should', 'could'],
        'correctAnswer': 'should',
      },
    ],
  },
  {
    'title': 'Subject-Verb Concord',
    'hindiTitle': 'विषय-क्रिया समझौता',
    'rules': [
      {
        'rule':
            'Singular subjects take singular verbs; plural subjects take plural verbs.',
        'hindiRule':
            'एकवचन कर्ता -> एकवचन क्रिया; बहुवचन कर्ता -> बहुवचन क्रिया।',
        'example': 'The boy plays. / The boys play.',
      },
      {
        'rule': 'Subjects joined by "and" usually take a plural verb.',
        'hindiRule': '"and" से जुड़े कर्ता आमतौर पर बहुवचन क्रिया लेते हैं।',
        'example': 'Ram and Shyam are friends.',
      },
      {
        'rule':
            'Two singular subjects referring to the same person/thing take a singular verb.',
        'hindiRule':
            'यदि दो एकवचन संज्ञाएँ एक ही व्यक्ति/वस्तु के लिए हों, तो एकवचन क्रिया का प्रयोग करें।',
        'example': 'The poet and philosopher is dead.',
      },
      {
        'rule':
            'Words like "Each", "Every", "Either", "Neither", "One" take a singular verb.',
        'hindiRule':
            '"Each", "Every", "Either", "Neither", "One" जैसे शब्द एकवचन क्रिया लेते हैं।',
        'example': 'Each of the boys has a book.',
      },
      {
        'rule':
            'Collective nouns (committee, jury, team) take a singular verb when considered as a unit.',
        'hindiRule':
            'समूहवाचक संज्ञाएँ (committee, jury, team) एक इकाई के रूप में एकवचन क्रिया लेती हैं।',
        'example': 'The committee has issued its report.',
      },
      {
        'rule':
            'When subjects are joined by "or", "nor", "either...or", "neither...nor", the verb agrees with the nearer subject.',
        'hindiRule':
            'जब कर्ता "or", "nor", "either...or", "neither...nor" से जुड़े हों, तो क्रिया निकटतम कर्ता के अनुसार होती है।',
        'example': 'Neither the teacher nor the students were present.',
      },
    ],
    'quiz': [
      {
        'question': 'Bread and butter _______ his favorite breakfast.',
        'options': ['is', 'are', 'were', 'have'],
        'correctAnswer': 'is',
      },
      {
        'question': 'The players as well as the captain _______ ready.',
        'options': ['is', 'are', 'was', 'has'],
        'correctAnswer': 'are',
      },
      {
        'question': 'Neither of the answers _______ correct.',
        'options': ['is', 'are', 'were', 'have'],
        'correctAnswer': 'is',
      },
      {
        'question': 'Fifty kilometers _______ a long distance.',
        'options': ['is', 'are', 'were', 'have'],
        'correctAnswer': 'is',
      },
      {
        'question': 'The quality of the apples _______ poor.',
        'options': ['was', 'were', 'are', 'have'],
        'correctAnswer': 'was',
      },
    ],
  },
  {
    'title': 'Reported Speech (Direct-Indirect)',
    'hindiTitle': 'कथन परिवर्तन',
    'rules': [
      {
        'rule':
            'Change of Tense: Present -> Past (unless reporting verb is in present/future or universal truth).',
        'hindiRule':
            'काल परिवर्तन: वर्तमान -> भूतकाल (यदि रिपोर्टिंग क्रिया वर्तमान/भविष्य में न हो या सार्वभौमिक सत्य न हो)।',
        'example': 'He said, "I am busy." -> He said that he was busy.',
      },
      {
        'rule':
            'Change of Pronouns: Change according to SON (Subject-1st, Object-2nd, No change-3rd).',
        'hindiRule':
            'सर्वनाम परिवर्तन: SON नियम (First person -> Subject, Second person -> Object, Third person -> No change)।',
        'example':
            'She said to me, "You are late." -> She told me that I was late.',
      },
      {
        'rule':
            'Questions (Wh- words): No "that". Use Wh- word as connector. Change question order to statement.',
        'hindiRule':
            'प्रश्न (Wh- words): "that" का प्रयोग न करें। Wh- शब्द ही योजक होगा। प्रश्नवाचक वाक्य को साधारण वाक्य में बदलें।',
        'example':
            'He said, "Where are you going?" -> He asked where I was going.',
      },
      {
        'rule':
            'Questions (Yes/No): Use "if" or "whether". Change question order to statement.',
        'hindiRule':
            'प्रश्न (Yes/No): "if" या "whether" का प्रयोग करें। प्रश्नवाचक वाक्य को साधारण वाक्य में बदलें।',
        'example': 'He said, "Are you okay?" -> He asked if I was okay.',
      },
      {
        'rule':
            'Imperatives (Orders/Requests): Use "to" + V1. Change reporting verb to ordered/requested/advised.',
        'hindiRule':
            'आदेश/निवेदन: "to" + क्रिया का प्रयोग करें। Reporting verb को ordered/requested में बदलें।',
        'example':
            'Teacher said, "Sit down." -> The teacher ordered to sit down.',
      },
      {
        'rule':
            'Time/Place Words: Now->Then, Here->There, Tomorrow->The next day, Yesterday->The previous day.',
        'hindiRule':
            'समय/स्थान वाले शब्द: Now->Then, Here->There, Tomorrow->The next day, Yesterday->The previous day.',
        'example':
            'He said, "I will come tomorrow." -> He said that he would come the next day.',
      },
    ],
    'quiz': [
      {
        'question': 'He said, "I am tired." -> He said that he _______ tired.',
        'options': ['is', 'was', 'were', 'had been'],
        'correctAnswer': 'was',
      },
      {
        'question':
            'She said to me, "Open the door." -> She _______ me to open the door.',
        'options': ['said', 'told', 'ordered', 'asked'],
        'correctAnswer': 'ordered',
      },
      {
        'question':
            'He asked, "Where do you live?" -> He asked where I _______.',
        'options': ['live', 'lived', 'living', 'lives'],
        'correctAnswer': 'lived',
      },
      {
        'question': 'Ram said, "I can swim." -> Ram said that he _______ swim.',
        'options': ['can', 'could', 'may', 'might'],
        'correctAnswer': 'could',
      },
      {
        'question': 'He says, "I am happy." -> He says that he _______ happy.',
        'options': ['is', 'was', 'were', 'had been'],
        'correctAnswer': 'is',
      },
    ],
  },
  {
    'title': 'Clauses',
    'hindiTitle': 'उपवाक्य',
    'rules': [
      {
        'rule':
            'Noun Clause: Functions as a noun (Subject/Object). Often starts with that, what, who, etc.',
        'hindiRule':
            'संज्ञा उपवाक्य: संज्ञा की तरह कार्य करता है (कर्ता/कर्म)। अक्सर that, what, who से शुरू होता है।',
        'example':
            'I know that he is honest. ("that he is honest" acts as object)',
      },
      {
        'rule':
            'Adverb Clause: Modifies a verb/adjective/adverb showing time, place, condition, reason, etc.',
        'hindiRule':
            'क्रिया-विशेषण उपवाक्य: समय, स्थान, शर्त, कारण आदि बताता है। (When, where, if, because)',
        'example': 'Call me when you reach home.',
      },
      {
        'rule':
            'Relative Clause: Describes a noun. Starts with relative pronouns (who, which, that, whose).',
        'hindiRule':
            'संबंधवाचक उपवाक्य: संज्ञा की विशेषता बताता है। Who, which, that से शुरू होता है।',
        'example': 'The boy who met me yesterday is my friend.',
      },
    ],
    'quiz': [
      {
        'question': 'I know the place _______ he lives. (Relative Clause)',
        'options': ['when', 'where', 'why', 'what'],
        'correctAnswer': 'where',
      },
      {
        'question': '_______ you work hard, you will succeed. (Adverb Clause)',
        'options': ['If', 'That', 'Who', 'Which'],
        'correctAnswer': 'If',
      },
      {
        'question': 'I think _______ he is right. (Noun Clause)',
        'options': ['if', 'that', 'where', 'when'],
        'correctAnswer': 'that',
      },
      {
        'question':
            'The book _______ is on the table is mine. (Relative Clause)',
        'options': ['who', 'which', 'where', 'when'],
        'correctAnswer': 'which',
      },
      {
        'question': 'He left _______ the rain started. (Adverb Clause)',
        'options': ['before', 'who', 'which', 'that'],
        'correctAnswer': 'before',
      },
    ],
  },
  {
    'title': 'Determiners',
    'hindiTitle': 'निर्धारक',
    'rules': [
      {
        'rule':
            'Articles (A/An/The): A/An for indefinite singular countable nouns. The for definite/specific nouns.',
        'hindiRule':
            'A/An: अनिश्चित एकवचन गणनीय संज्ञाओं के लिए। The: निश्चित/विशिष्ट संज्ञाओं के लिए।',
        'example': 'I saw a bird. The bird was blue.',
      },
      {
        'rule':
            'Quantifiers (Some/Any): Some in positive sentences. Any in negative/questions.',
        'hindiRule':
            'Some: सकारात्मक वाक्यों में। Any: नकारात्मक/प्रश्नवाचक वाक्यों में।',
        'example': 'I have some money. / Do you have any money?',
      },
      {
        'rule':
            'Quantifiers (Much/Many): Much with uncountable nouns. Many with countable nouns.',
        'hindiRule':
            'Much: अगणनीय संज्ञाओं के साथ। Many: गणनीय संज्ञाओं के साथ।',
        'example': 'How much water? / How many books?',
      },
      {
        'rule':
            'Quantifiers (Few/Little): Few/A few for numbers. Little/A little for quantity.',
        'hindiRule': 'Few/A few संख्या के लिए। Little/A little मात्रा के लिए।',
        'example': 'Few friends visited. / A little hope is left.',
      },
    ],
    'quiz': [
      {
        'question': 'Have you got _______ money?',
        'options': ['some', 'any', 'many', 'few'],
        'correctAnswer': 'any',
      },
      {
        'question': '_______ Sun rises in the east.',
        'options': ['A', 'An', 'The', 'None'],
        'correctAnswer': 'The',
      },
      {
        'question': 'How _______ apples did you buy?',
        'options': ['much', 'many', 'little', 'less'],
        'correctAnswer': 'many',
      },
      {
        'question': 'There is _______ water in the jug.',
        'options': ['few', 'a few', 'many', 'a little'],
        'correctAnswer': 'a little',
      },
      {
        'question': 'He is _______ honest man.',
        'options': ['a', 'an', 'the', 'none'],
        'correctAnswer': 'an',
      },
    ],
  },
  {
    'title': 'Prepositions',
    'hindiTitle': 'पूर्वसर्ग',
    'rules': [
      {
        'rule': 'At: Specific time (at 5 PM) or place (at school).',
        'hindiRule': 'At: विशिष्ट समय (at 5 PM) या स्थान (at school) के लिए।',
        'example': 'He is at home. The meeting is at 10 AM.',
      },
      {
        'rule': 'In: Enclosed spaces (in the room), months/years (in 2023).',
        'hindiRule':
            'In: बंद स्थानों (in the room), महीनों/वर्षों (in 2023) के लिए।',
        'example': 'I live in India. She was born in June.',
      },
      {
        'rule': 'On: Surfaces (on the table), days/dates (on Sunday).',
        'hindiRule':
            'On: सतहों (on the table), दिनों/तिथियों (on Sunday) के लिए।',
        'example': 'The book is on the table. See you on Monday.',
      },
      {
        'rule': 'By: Deadline (by 5 PM), agent in passive voice (by Ram).',
        'hindiRule':
            'By: समय सीमा (by 5 PM), निष्क्रिय वाच्य में कर्ता (by Ram) के लिए।',
        'example': 'Submit the work by evening. The letter was written by him.',
      },
      {
        'rule':
            'Between vs Among: Between for two people/things. Among for more than two.',
        'hindiRule':
            'Between: दो व्यक्तियों/वस्तुओं के बीच। Among: दो से अधिक के बीच।',
        'example':
            'Divide this between Ram and Shyam. Distribute sweets among students.',
      },
    ],
    'quiz': [
      {
        'question': 'He is afraid _______ dogs.',
        'options': ['of', 'from', 'with', 'by'],
        'correctAnswer': 'of',
      },
      {
        'question': 'The cat jumped _______ the table.',
        'options': ['in', 'on', 'upon', 'at'],
        'correctAnswer': 'upon',
      },
      {
        'question': 'She has been living here _______ 2010.',
        'options': ['from', 'for', 'since', 'by'],
        'correctAnswer': 'since',
      },
      {
        'question': 'Distribute the sweets _______ the children.',
        'options': ['between', 'among', 'in', 'on'],
        'correctAnswer': 'among',
      },
      {
        'question': 'The meeting starts _______ 9 AM.',
        'options': ['on', 'in', 'at', 'by'],
        'correctAnswer': 'at',
      },
    ],
  },
];
