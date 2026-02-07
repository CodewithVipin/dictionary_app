const List<Map<String, dynamic>> rootWords = [
  {
    'root': 'A/An',
    'meaning': 'Not, Without (नहीं, बिना)',
    'examples': [
      {'word': 'Atheist', 'usage': 'नास्तिक'},
      {'word': 'Anarchy', 'usage': 'अराजकता'},
      {'word': 'Anonymous', 'usage': 'गुमनाम'},
    ],
  },
  {
    'root': 'Ab',
    'meaning': 'Away, From (दूर, से)',
    'examples': [
      {'word': 'Absent', 'usage': 'अनुपस्थित'},
      {'word': 'Abduct', 'usage': 'अपहरण करना'},
      {'word': 'Abnormal', 'usage': 'असामान्य'},
    ],
  },
  {
    'root': 'Ad',
    'meaning': 'To, Towards (की ओर, पास)',
    'examples': [
      {'word': 'Advance', 'usage': 'आगे बढ़ना'},
      {'word': 'Adhere', 'usage': 'पालन करना'},
      {'word': 'Adjacent', 'usage': 'सटा हुआ'},
    ],
  },
  {
    'root': 'Ambi',
    'meaning': 'Both (दोनों)',
    'examples': [
      {'word': 'Ambidextrous', 'usage': 'सव्यसाची (दोनों हाथों में निपुण)'},
      {'word': 'Ambiguous', 'usage': 'अस्पष्ट (द्विअर्थी)'},
      {'word': 'Ambivalent', 'usage': 'उभयभावी'},
    ],
  },
  {
    'root': 'Ante',
    'meaning': 'Before (पहले)',
    'examples': [
      {'word': 'Antecedent', 'usage': 'पूर्ववृत्त'},
      {'word': 'Antemeridian', 'usage': 'पूर्वाह्न (AM)'},
      {'word': 'Antechamber', 'usage': 'प्रतीक्षालय'},
    ],
  },
  {
    'root': 'Anti',
    'meaning': 'Against (विरुद्ध)',
    'examples': [
      {'word': 'Antibody', 'usage': 'प्रतिरक्षी'},
      {'word': 'Antidote', 'usage': 'विषहर'},
      {'word': 'Antisocial', 'usage': 'समाज विरोधी'},
    ],
  },
  {
    'root': 'Aqua',
    'meaning': 'Water (पानी)',
    'examples': [
      {'word': 'Aquarium', 'usage': 'मछलीघर'},
      {'word': 'Aquatic', 'usage': 'जलीय'},
      {'word': 'Aqueduct', 'usage': 'जलकुंड'},
    ],
  },
  {
    'root': 'Arch',
    'meaning': 'Chief, Rule (मुख्य, शासन)',
    'examples': [
      {'word': 'Architect', 'usage': 'वास्तुकार'},
      {'word': 'Monarchy', 'usage': 'राजतन्त्र'},
      {'word': 'Hierarchy', 'usage': 'पदानुक्रम'},
    ],
  },
  {
    'root': 'Aud',
    'meaning': 'Hear (सुनना)',
    'examples': [
      {'word': 'Audible', 'usage': 'सुनने योग्य'},
      {'word': 'Audience', 'usage': 'दर्शक/श्रोतागण'},
      {'word': 'Audition', 'usage': 'स्वर-परीक्षण'},
    ],
  },
  {
    'root': 'Auto',
    'meaning': 'Self (स्वयं)',
    'examples': [
      {'word': 'Autobiography', 'usage': 'आत्मकथा'},
      {'word': 'Automobile', 'usage': 'मोटरगाड़ी'},
      {'word': 'Autonomy', 'usage': 'स्वायत्तता'},
    ],
  },
  {
    'root': 'Bell',
    'meaning': 'War (युद्ध)',
    'examples': [
      {'word': 'Belligerent', 'usage': 'लड़ाकू'},
      {'word': 'Rebellion', 'usage': 'विद्रोह'},
      {'word': 'Bellicose', 'usage': 'युद्धप्रिय'},
    ],
  },
  {
    'root': 'Bene',
    'meaning': 'Good, Well (अच्छा)',
    'examples': [
      {'word': 'Beneficial', 'usage': 'लाभकारी'},
      {'word': 'Benevolent', 'usage': 'परोपकारी'},
      {'word': 'Benediction', 'usage': 'आशीर्वाद'},
    ],
  },
  {
    'root': 'Bi',
    'meaning': 'Two (दो)',
    'examples': [
      {'word': 'Bicycle', 'usage': 'साइकिल'},
      {'word': 'Bilingual', 'usage': 'द्विभाषी'},
      {'word': 'Binoculars', 'usage': 'दूरबीन'},
    ],
  },
  {
    'root': 'Biblio',
    'meaning': 'Book (किताब)',
    'examples': [
      {'word': 'Bibliography', 'usage': 'ग्रंथ सूची'},
      {'word': 'Bibliophile', 'usage': 'पुस्तक प्रेमी'},
      {'word': 'Bible', 'usage': 'पवित्र ग्रंथ'},
    ],
  },
  {
    'root': 'Bio',
    'meaning': 'Life (जीवन)',
    'examples': [
      {'word': 'Biology', 'usage': 'जीव विज्ञान'},
      {'word': 'Biography', 'usage': 'जीवनी'},
      {'word': 'Biosphere', 'usage': 'जीवमंडल'},
    ],
  },
  {
    'root': 'Cap',
    'meaning': 'Take, Seize (लेना, पकड़ना)',
    'examples': [
      {'word': 'Capture', 'usage': 'पकड़ना'},
      {'word': 'Captive', 'usage': 'बंदी'},
      {'word': 'Capacity', 'usage': 'क्षमता'},
    ],
  },
  {
    'root': 'Carn',
    'meaning': 'Flesh (मांस)',
    'examples': [
      {'word': 'Carnivorous', 'usage': 'मांसाहारी'},
      {'word': 'Incarnation', 'usage': 'अवतार'},
      {'word': 'Carnage', 'usage': 'नरसंहार'},
    ],
  },
  {
    'root': 'Ced/Ceed',
    'meaning': 'Go, Yield (जाना, मान लेना)',
    'examples': [
      {'word': 'Proceed', 'usage': 'आगे बढ़ना'},
      {'word': 'Recede', 'usage': 'पीछे हटना'},
      {'word': 'Concede', 'usage': 'स्वीकार करना'},
    ],
  },
  {
    'root': 'Cent',
    'meaning': 'Hundred (सौ)',
    'examples': [
      {'word': 'Century', 'usage': 'शताब्दी'},
      {'word': 'Centimeter', 'usage': 'सेंटीमीटर'},
      {'word': 'Percent', 'usage': 'प्रतिशत'},
    ],
  },
  {
    'root': 'Chron',
    'meaning': 'Time (समय)',
    'examples': [
      {'word': 'Chronology', 'usage': 'कालक्रम'},
      {'word': 'Chronic', 'usage': 'दीर्घकालिक'},
      {'word': 'Synchronize', 'usage': 'एक साथ होना'},
    ],
  },
  {
    'root': 'Cide',
    'meaning': 'Kill (मारना)',
    'examples': [
      {'word': 'Suicide', 'usage': 'आत्महत्या'},
      {'word': 'Homicide', 'usage': 'नरहत्या'},
      {'word': 'Pesticide', 'usage': 'कीटनाशक'},
    ],
  },
  {
    'root': 'Circum',
    'meaning': 'Around (चारों ओर)',
    'examples': [
      {'word': 'Circumference', 'usage': 'परिधि'},
      {'word': 'Circumnavigate', 'usage': 'परिक्रमा करना'},
      {'word': 'Circumstance', 'usage': 'परिस्थिति'},
    ],
  },
  {
    'root': 'Clam/Claim',
    'meaning': 'Cry out (चिल्लाना)',
    'examples': [
      {'word': 'Exclaim', 'usage': 'चिल्लाना'},
      {'word': 'Proclaim', 'usage': 'घोषणा करना'},
      {'word': 'Acclaim', 'usage': 'प्रशंसा करना'},
    ],
  },
  {
    'root': 'Cogn',
    'meaning': 'Know (जानना)',
    'examples': [
      {'word': 'Recognize', 'usage': 'पहचानना'},
      {'word': 'Cognitive', 'usage': 'संज्ञानात्मक'},
      {'word': 'Incognito', 'usage': 'गुप्त रूप से'},
    ],
  },
  {
    'root': 'Corp',
    'meaning': 'Body (शरीर)',
    'examples': [
      {'word': 'Corpse', 'usage': 'लाश'},
      {'word': 'Corporation', 'usage': 'निगम'},
      {'word': 'Incorporate', 'usage': 'शामिल करना'},
    ],
  },
  {
    'root': 'Cred',
    'meaning': 'Believe (विश्र्वास करना)',
    'examples': [
      {'word': 'Credible', 'usage': 'विश्वसनीय'},
      {'word': 'Credit', 'usage': 'श्रेय/उधार'},
      {'word': 'Incredible', 'usage': 'अविश्वसनीय'},
    ],
  },
  {
    'root': 'Crypt',
    'meaning': 'Hidden (छिपा हुआ)',
    'examples': [
      {'word': 'Cryptic', 'usage': 'गुप्त'},
      {'word': 'Encrypt', 'usage': 'कूटलेखन करना'},
      {'word': 'Crypt', 'usage': 'तहखाना'},
    ],
  },
  {
    'root': 'Culp',
    'meaning': 'Blame (दोष)',
    'examples': [
      {'word': 'Culprit', 'usage': 'अपराधी'},
      {'word': 'Culpable', 'usage': 'दोषी'},
      {'word': 'Exculpate', 'usage': 'दोषमुक्त करना'},
    ],
  },
  {
    'root': 'Cur',
    'meaning': 'Run (दौड़ना)',
    'examples': [
      {'word': 'Current', 'usage': 'वर्तमान/धारा'},
      {'word': 'Curriculum', 'usage': 'पाठ्यक्रम'},
      {'word': 'Occur', 'usage': 'घटित होना'},
    ],
  },
  {
    'root': 'Cycl',
    'meaning': 'Circle (चक्र)',
    'examples': [
      {'word': 'Bicycle', 'usage': 'साइकिल'},
      {'word': 'Cyclone', 'usage': 'चक्रवात'},
      {'word': 'Recycle', 'usage': 'पुनर्चक्रण'},
    ],
  },
  {
    'root': 'De',
    'meaning': 'Down, Away (नीचे, दूर)',
    'examples': [
      {'word': 'Descend', 'usage': 'नीचे उतरना'},
      {'word': 'Decline', 'usage': 'पतन/मना करना'},
      {'word': 'Depart', 'usage': 'प्रस्थान करना'},
    ],
  },
  {
    'root': 'Dec',
    'meaning': 'Ten (दस)',
    'examples': [
      {'word': 'Decade', 'usage': 'दशक'},
      {'word': 'Decimal', 'usage': 'दशमलव'},
      {'word': 'December', 'usage': 'दिसंबर'},
    ],
  },
  {
    'root': 'Dem',
    'meaning': 'People (लोग)',
    'examples': [
      {'word': 'Democracy', 'usage': 'लोकतंत्र'},
      {'word': 'Demographic', 'usage': 'जनसांख्यिकीय'},
      {'word': 'Epidemic', 'usage': 'महामारी'},
    ],
  },
  {
    'root': 'Derm',
    'meaning': 'Skin (त्वचा)',
    'examples': [
      {'word': 'Dermatologist', 'usage': 'त्वचा विशेषज्ञ'},
      {'word': 'Epidermis', 'usage': 'बाह्य त्वचा'},
      {'word': 'Dermatitis', 'usage': 'त्वचा की सूजन'},
    ],
  },
  {
    'root': 'Di/Dia',
    'meaning': 'Through, Across (के माध्यम से)',
    'examples': [
      {'word': 'Diameter', 'usage': 'व्यास'},
      {'word': 'Dialogue', 'usage': 'संवाद'},
      {'word': 'Diagnose', 'usage': 'निदान करना'},
    ],
  },
  {
    'root': 'Dic/Dict',
    'meaning': 'Speak, Say (बोलना)',
    'examples': [
      {'word': 'Dictionary', 'usage': 'शब्दकोश'},
      {'word': 'Dictate', 'usage': 'बोलकर लिखाना/आदेश देना'},
      {'word': 'Predict', 'usage': 'भविष्यवाणी करना'},
    ],
  },
  {
    'root': 'Doc',
    'meaning': 'Teach (सिखाना)',
    'examples': [
      {'word': 'Doctor', 'usage': 'चिकित्सक/विद्वान'},
      {'word': 'Document', 'usage': 'दस्तावेज़'},
      {'word': 'Doctrine', 'usage': 'सिद्धांत'},
    ],
  },
  {
    'root': 'Domin',
    'meaning': 'Master (मालिक)',
    'examples': [
      {'word': 'Dominate', 'usage': 'हावी होना'},
      {'word': 'Dominion', 'usage': 'अधिकार क्षेत्र'},
      {'word': 'Predominant', 'usage': 'प्रमुख'},
    ],
  },
  {
    'root': 'Don/Donat',
    'meaning': 'Give (देना)',
    'examples': [
      {'word': 'Donate', 'usage': 'दान करना'},
      {'word': 'Donor', 'usage': 'दाता'},
      {'word': 'Pardon', 'usage': 'क्षमा करना'},
    ],
  },
  {
    'root': 'Duc/Duct',
    'meaning': 'Lead (नेतृत्व करना)',
    'examples': [
      {'word': 'Conduct', 'usage': 'आचरण/संचालन'},
      {'word': 'Educate', 'usage': 'शिक्षित करना'},
      {'word': 'Induct', 'usage': 'शामिल करना'},
    ],
  },
  {
    'root': 'Dur',
    'meaning': 'Hard, Last (कठोर, टिकना)',
    'examples': [
      {'word': 'Durable', 'usage': 'टिकाऊ'},
      {'word': 'Duration', 'usage': 'अवधि'},
      {'word': 'Endure', 'usage': 'सहन करना'},
    ],
  },
  {
    'root': 'Dyn',
    'meaning': 'Power (शक्ति)',
    'examples': [
      {'word': 'Dynamic', 'usage': 'गतिशील'},
      {'word': 'Dynamite', 'usage': 'डायनामाइट'},
      {'word': 'Dynasty', 'usage': 'राजवंश'},
    ],
  },
  {
    'root': 'Ego',
    'meaning': 'Self (स्वयं/अहं)',
    'examples': [
      {'word': 'Egoist', 'usage': 'अहंवादी'},
      {'word': 'Egocentric', 'usage': 'आत्मकेंद्रित'},
      {'word': 'Egomaniac', 'usage': 'अहंकारी'},
    ],
  },
  {
    'root': 'Equ',
    'meaning': 'Equal (समान)',
    'examples': [
      {'word': 'Equal', 'usage': 'बराबर'},
      {'word': 'Equator', 'usage': 'भूमध्य रेखा'},
      {'word': 'Equilibrium', 'usage': 'संतुलन'},
    ],
  },
  {
    'root': 'Ex',
    'meaning': 'Out (बाहर)',
    'examples': [
      {'word': 'Exit', 'usage': 'निकास'},
      {'word': 'Exclude', 'usage': 'बाहर रखना'},
      {'word': 'Export', 'usage': 'निर्यात करना'},
    ],
  },
  {
    'root': 'Extra',
    'meaning': 'Outside (बाहरी)',
    'examples': [
      {'word': 'Extraordinary', 'usage': 'असाधारण'},
      {'word': 'Extraterrestrial', 'usage': 'अलौकिक'},
      {'word': 'Extravagant', 'usage': 'फिजूलखर्च'},
    ],
  },
  {
    'root': 'Fac/Fact',
    'meaning': 'Make, Do (बनाना, करना)',
    'examples': [
      {'word': 'Factory', 'usage': 'कारखाना'},
      {'word': 'Manufacture', 'usage': 'निर्माण करना'},
      {'word': 'Artifact', 'usage': 'कलाकृति'},
    ],
  },
  {
    'root': 'Fer',
    'meaning': 'Bear, Carry (ले जाना)',
    'examples': [
      {'word': 'Transfer', 'usage': 'स्थानांतरित करना'},
      {'word': 'Ferry', 'usage': 'नौका'},
      {'word': 'Confer', 'usage': 'प्रदान करना/चर्चा करना'},
    ],
  },
  {
    'root': 'Fid',
    'meaning': 'Faith (विश्वास)',
    'examples': [
      {'word': 'Fidelity', 'usage': 'वफादारी'},
      {'word': 'Confident', 'usage': 'आत्मविश्वासी'},
      {'word': 'Bona fide', 'usage': 'असली/प्रामाणिक'},
    ],
  },
  {
    'root': 'Fin',
    'meaning': 'End (अंत)',
    'examples': [
      {'word': 'Final', 'usage': 'अंतिम'},
      {'word': 'Finite', 'usage': 'सीमित'},
      {'word': 'Finish', 'usage': 'समाप्त करना'},
    ],
  },
  {
    'root': 'Flect/Flex',
    'meaning': 'Bend (झुकना/मोड़ना)',
    'examples': [
      {'word': 'Flexible', 'usage': 'लचकदार'},
      {'word': 'Reflect', 'usage': 'प्रतिबिंबित करना'},
      {'word': 'Deflect', 'usage': 'मोड़ना'},
    ],
  },
  {
    'root': 'Flor',
    'meaning': 'Flower (फूल)',
    'examples': [
      {'word': 'Floral', 'usage': 'पुष्प संबंधी'},
      {'word': 'Florist', 'usage': 'फूलवाला'},
      {'word': 'Flourish', 'usage': 'फलना-फूलना'},
    ],
  },
  {
    'root': 'Flu',
    'meaning': 'Flow (बहाव)',
    'examples': [
      {'word': 'Fluid', 'usage': 'तरल'},
      {'word': 'Fluent', 'usage': 'धाराप्रवाह'},
      {'word': 'Influenza', 'usage': 'इन्फ्लूएंजा (फ्लू)'},
    ],
  },
  {
    'root': 'Form',
    'meaning': 'Shape (आकार)',
    'examples': [
      {'word': 'Format', 'usage': 'प्रारूप'},
      {'word': 'Formula', 'usage': 'सूत्र'},
      {'word': 'Transform', 'usage': 'बदलना'},
    ],
  },
  {
    'root': 'Fort',
    'meaning': 'Strong (मजबूत)',
    'examples': [
      {'word': 'Fortify', 'usage': 'मजबूत करना'},
      {'word': 'Fortress', 'usage': 'किला'},
      {'word': 'Comfort', 'usage': 'आराम'},
    ],
  },
  {
    'root': 'Fract/Frag',
    'meaning': 'Break (तोड़ना)',
    'examples': [
      {'word': 'Fracture', 'usage': 'हड्डी टूटना'},
      {'word': 'Fragment', 'usage': 'टुकड़ा'},
      {'word': 'Fragile', 'usage': 'नाजुक'},
    ],
  },
  {
    'root': 'Frater',
    'meaning': 'Brother (भाई)',
    'examples': [
      {'word': 'Fraternity', 'usage': 'बिरादरी'},
      {'word': 'Fraternize', 'usage': 'भाईचारा रखना'},
      {'word': 'Fraternal', 'usage': 'भ्रातृवत'},
    ],
  },
  {
    'root': 'Gam',
    'meaning': 'Marriage (विवाह)',
    'examples': [
      {'word': 'Polygamy', 'usage': 'बहुविवाह'},
      {'word': 'Monogamy', 'usage': 'एकविवाह'},
      {'word': 'Bigamy', 'usage': 'द्विविवाह'},
    ],
  },
  {
    'root': 'Gen',
    'meaning': 'Birth, Race (जन्म, जाति)',
    'examples': [
      {'word': 'Generation', 'usage': 'पीढ़ी'},
      {'word': 'Genetics', 'usage': 'आनुवंशिकी'},
      {'word': 'Genealogy', 'usage': 'वंशावली'},
    ],
  },
  {
    'root': 'Geo',
    'meaning': 'Earth (पृथ्वी)',
    'examples': [
      {'word': 'Geography', 'usage': 'भूगोल'},
      {'word': 'Geology', 'usage': 'भूविज्ञान'},
      {'word': 'Geometry', 'usage': 'ज्यामिति'},
    ],
  },
  {
    'root': 'Gno',
    'meaning': 'Know (जानना)',
    'examples': [
      {'word': 'Diagnose', 'usage': 'निदान करना'},
      {'word': 'Prognosis', 'usage': 'पूर्वानुमान'},
      {'word': 'Ignorant', 'usage': 'अज्ञानी'},
    ],
  },
  {
    'root': 'Grad/Gress',
    'meaning': 'Step (कदम)',
    'examples': [
      {'word': 'Gradual', 'usage': 'क्रमिक'},
      {'word': 'Progress', 'usage': 'प्रगति'},
      {'word': 'Aggressive', 'usage': 'आक्रामक'},
    ],
  },
  {
    'root': 'Graph/Gram',
    'meaning': 'Write (लिखना)',
    'examples': [
      {'word': 'Autograph', 'usage': 'हस्ताक्षर'},
      {'word': 'Paragraph', 'usage': 'अनुच्छेद'},
      {'word': 'Grammar', 'usage': 'व्याकरण'},
    ],
  },
  {
    'root': 'Grat',
    'meaning': 'Pleasing (सुखद/आभारी)',
    'examples': [
      {'word': 'Gratitude', 'usage': 'कृतज्ञता'},
      {'word': 'Congratulate', 'usage': 'बधाई देना'},
      {'word': 'Grateful', 'usage': 'आभारी'},
    ],
  },
  {
    'root': 'Greg',
    'meaning': 'Gather (इकट्ठा होना)',
    'examples': [
      {'word': 'Congregate', 'usage': 'एकत्रित होना'},
      {'word': 'Segregate', 'usage': 'अलग करना'},
      {'word': 'Gregarious', 'usage': 'मिलनसार'},
    ],
  },
  {
    'root': 'Hab/Hib',
    'meaning': 'Hold (पकड़ना/रहना)',
    'examples': [
      {'word': 'Habit', 'usage': 'आदत'},
      {'word': 'Exhibit', 'usage': 'प्रदर्शन करना'},
      {'word': 'Prohibit', 'usage': 'निषेध करना'},
    ],
  },
  {
    'root': 'Hetero',
    'meaning': 'Different (भिन्न)',
    'examples': [
      {'word': 'Heterogeneous', 'usage': 'विषम'},
      {'word': 'Heterosexual', 'usage': 'विषमलिंगी'},
      {'word': 'Heterodox', 'usage': 'पाखंडी/भिन्न मत वाला'},
    ],
  },
  {
    'root': 'Homo',
    'meaning': 'Same (समान)',
    'examples': [
      {'word': 'Homogeneous', 'usage': 'सजातीय'},
      {'word': 'Homonym', 'usage': 'समान नाम'},
      {'word': 'Homophone', 'usage': 'समान ध्वनि'},
    ],
  },
  {
    'root': 'Hydr',
    'meaning': 'Water (पानी)',
    'examples': [
      {'word': 'Hydrate', 'usage': 'हाइड्रेट'},
      {'word': 'Hydroelectric', 'usage': 'जलविद्युत'},
      {'word': 'Dehydrate', 'usage': 'निर्जलीकरण'},
    ],
  },
  {
    'root': 'Hyper',
    'meaning': 'Over, Above (अत्यधिक/ऊपर)',
    'examples': [
      {'word': 'Hyperactive', 'usage': 'अतिसक्रिय'},
      {'word': 'Hyperbole', 'usage': 'अतिशयोक्ति'},
      {'word': 'Hypertension', 'usage': 'उच्च रक्तचाप'},
    ],
  },
  {
    'root': 'Hypo',
    'meaning': 'Under (नीचे)',
    'examples': [
      {'word': 'Hypothermia', 'usage': 'अल्पताप'},
      {'word': 'Hypothesis', 'usage': 'परिकल्पना'},
      {'word': 'Hypocrisy', 'usage': 'पाखंड'},
    ],
  },
  {
    'root': 'Inter',
    'meaning': 'Between (बीच में)',
    'examples': [
      {'word': 'International', 'usage': 'अंतर्राष्ट्रीय'},
      {'word': 'Intercept', 'usage': 'रोकना'},
      {'word': 'Intervene', 'usage': 'हस्तक्षेप करना'},
    ],
  },
  {
    'root': 'Intra',
    'meaning': 'Within (भीतर)',
    'examples': [
      {'word': 'Intranet', 'usage': 'इंट्रानेट'},
      {'word': 'Intravenous', 'usage': 'नसों के अंदर'},
      {'word': 'Intramural', 'usage': 'चारदीवारी के भीतर'},
    ],
  },
  {
    'root': 'Ject',
    'meaning': 'Throw (फेंकना)',
    'examples': [
      {'word': 'Eject', 'usage': 'बाहर निकालना'},
      {'word': 'Project', 'usage': 'परियोजना/फेंकना'},
      {'word': 'Reject', 'usage': 'अस्वीकार करना'},
    ],
  },
  {
    'root': 'Jud',
    'meaning': 'Judge (न्याय)',
    'examples': [
      {'word': 'Judge', 'usage': 'न्यायाधीश'},
      {'word': 'Judicial', 'usage': 'न्यायिक'},
      {'word': 'Prejudice', 'usage': 'पक्षपात'},
    ],
  },
  {
    'root': 'Junct',
    'meaning': 'Join (जोड़ना)',
    'examples': [
      {'word': 'Junction', 'usage': 'संगम'},
      {'word': 'Conjunction', 'usage': 'संयोजन'},
      {'word': 'Adjunct', 'usage': 'सहायक'},
    ],
  },
  {
    'root': 'Jur',
    'meaning': 'Law (कानून)',
    'examples': [
      {'word': 'Jury', 'usage': 'जूरी'},
      {'word': 'Jurisdiction', 'usage': 'अधिकार क्षेत्र'},
      {'word': 'Jurist', 'usage': 'विधिवेत्ता'},
    ],
  },
  {
    'root': 'Lab',
    'meaning': 'Work (काम)',
    'examples': [
      {'word': 'Labor', 'usage': 'श्रम'},
      {'word': 'Collaborate', 'usage': 'सहयोग करना'},
      {'word': 'Laboratory', 'usage': 'प्रयोगशाला'},
    ],
  },
  {
    'root': 'Lat',
    'meaning': 'Side (पक्ष/किनारा)',
    'examples': [
      {'word': 'Lateral', 'usage': 'पार्श्व'},
      {'word': 'Bilateral', 'usage': 'द्विपक्षीय'},
      {'word': 'Latitude', 'usage': 'अक्षांश'},
    ],
  },
  {
    'root': 'Leg/Lect',
    'meaning': 'Read, Choose (पढ़ना/चुनना)',
    'examples': [
      {'word': 'Legible', 'usage': 'पढ़ने योग्य'},
      {'word': 'Lecture', 'usage': 'व्याख्यान'},
      {'word': 'Elect', 'usage': 'चुनना'},
    ],
  },
  {
    'root': 'Lev',
    'meaning': 'Light, Rise (हल्का, उठना)',
    'examples': [
      {'word': 'Elevator', 'usage': 'लिफ्ट'},
      {'word': 'Alleviate', 'usage': 'कम करना'},
      {'word': 'Levitate', 'usage': 'हवा में उठना'},
    ],
  },
  {
    'root': 'Liber',
    'meaning': 'Free (azad)',
    'examples': [
      {'word': 'Liberty', 'usage': 'स्वतंत्रता'},
      {'word': 'Liberate', 'usage': 'मुक्त करना'},
      {'word': 'Liberal', 'usage': 'उदार'},
    ],
  },
  {
    'root': 'Lingua',
    'meaning': 'Language (भाषा)',
    'examples': [
      {'word': 'Linguist', 'usage': 'भाषाविद्'},
      {'word': 'Bilingual', 'usage': 'द्विभाषी'},
      {'word': 'Language', 'usage': 'भाषा'},
    ],
  },
  {
    'root': 'Loc',
    'meaning': 'Place (स्थान)',
    'examples': [
      {'word': 'Location', 'usage': 'स्थान'},
      {'word': 'Dislocate', 'usage': 'अविस्थित करना'},
      {'word': 'Local', 'usage': 'स्थानीय'},
    ],
  },
  {
    'root': 'Log/Logue',
    'meaning': 'Word, Study (शब्द, अध्ययन)',
    'examples': [
      {'word': 'Logic', 'usage': 'तर्क'},
      {'word': 'Dialogue', 'usage': 'संवाद'},
      {'word': 'Prologue', 'usage': 'प्रस्तावना'},
    ],
  },
  {
    'root': 'Luc/Lum',
    'meaning': 'Light (प्रकाश)',
    'examples': [
      {'word': 'Lucid', 'usage': 'स्पष्ट'},
      {'word': 'Illuminate', 'usage': 'रोशन करना'},
      {'word': 'Translucent', 'usage': 'अर्धपारदर्शी'},
    ],
  },
  {
    'root': 'Mag/Maj',
    'meaning': 'Great (महान)',
    'examples': [
      {'word': 'Magnificent', 'usage': 'शानदार'},
      {'word': 'Major', 'usage': 'प्रमुख'},
      {'word': 'Majesty', 'usage': 'महामहिम'},
    ],
  },
  {
    'root': 'Mal',
    'meaning': 'Bad (बुरा)',
    'examples': [
      {'word': 'Malicious', 'usage': 'दुर्भावनापूर्ण'},
      {'word': 'Malfunction', 'usage': 'खराबी'},
      {'word': 'Malnutrition', 'usage': 'कुपोषण'},
    ],
  },
  {
    'root': 'Man',
    'meaning': 'Hand (हाथ)',
    'examples': [
      {'word': 'Manual', 'usage': 'हस्तचालित'},
      {'word': 'Manufacture', 'usage': 'निर्माण करना'},
      {'word': 'Manuscript', 'usage': 'हस्तलिपि'},
    ],
  },
  {
    'root': 'Mand',
    'meaning': 'Order (आदेश)',
    'examples': [
      {'word': 'Mandatory', 'usage': 'अनिवार्य'},
      {'word': 'Command', 'usage': 'आदेश'},
      {'word': 'Demand', 'usage': 'मांग'},
    ],
  },
  {
    'root': 'Mar',
    'meaning': 'Sea (समुद्र)',
    'examples': [
      {'word': 'Marine', 'usage': 'समुद्री'},
      {'word': 'Submarine', 'usage': 'पनडुब्बी'},
      {'word': 'Maritime', 'usage': 'समुद्री'},
    ],
  },
  {
    'root': 'Mater',
    'meaning': 'Mother (माँ)',
    'examples': [
      {'word': 'Maternal', 'usage': 'मातृ'},
      {'word': 'Maternity', 'usage': ' मातृत्व'},
      {'word': 'Matriarch', 'usage': 'कुलमाता'},
    ],
  },
  {
    'root': 'Max',
    'meaning': 'Greatest (सबसे बड़ा)',
    'examples': [
      {'word': 'Maximum', 'usage': 'अधिकतम'},
      {'word': 'Maximize', 'usage': 'अधिकतम करना'},
      {'word': 'Climax', 'usage': 'चरम सीमा'},
    ],
  },
  {
    'root': 'Medi',
    'meaning': 'Middle (मध्य)',
    'examples': [
      {'word': 'Medium', 'usage': 'मध्यम'},
      {'word': 'Medieval', 'usage': 'मध्यकालीन'},
      {'word': 'Mediator', 'usage': 'मध्यस्थ'},
    ],
  },
  {
    'root': 'Mega',
    'meaning': 'Large (विशाल)',
    'examples': [
      {'word': 'Megaphone', 'usage': 'ध्वनि-विस्तारक'},
      {'word': 'Megabyte', 'usage': 'मेगाबाइट'},
      {'word': 'Megalopolis', 'usage': 'विशाल नगर'},
    ],
  },
  {
    'root': 'Mem',
    'meaning': 'Remember (याद रखना)',
    'examples': [
      {'word': 'Memory', 'usage': 'स्मृति'},
      {'word': 'Memorial', 'usage': 'स्मारक'},
      {'word': 'Remember', 'usage': 'याद करना'},
    ],
  },
  {
    'root': 'Ment',
    'meaning': 'Mind (मन)',
    'examples': [
      {'word': 'Mental', 'usage': 'मानसिक'},
      {'word': 'Mention', 'usage': 'उल्लेख करना'},
      {'word': 'Demented', 'usage': 'पागल'},
    ],
  },
  {
    'root': 'Meter/Metr',
    'meaning': 'Measure (मापना)',
    'examples': [
      {'word': 'Thermometer', 'usage': 'तापमापी'},
      {'word': 'Metric', 'usage': 'मीटर संबंधी'},
      {'word': 'Diameter', 'usage': 'व्यास'},
    ],
  },
  {
    'root': 'Micro',
    'meaning': 'Small (छोटा)',
    'examples': [
      {'word': 'Microscope', 'usage': 'सूक्ष्मदर्शी'},
      {'word': 'Microbiology', 'usage': 'सूक्ष्म जीव विज्ञान'},
      {'word': 'Microcosm', 'usage': 'सूक्ष्म जगत'},
    ],
  },
  {
    'root': 'Migr',
    'meaning': 'Move (स्थानांतरण)',
    'examples': [
      {'word': 'Migrate', 'usage': 'प्रवास करना'},
      {'word': 'Immigrant', 'usage': 'आप्रवासी'},
      {'word': 'Migratory', 'usage': 'प्रवासी'},
    ],
  },
  {
    'root': 'Min',
    'meaning': 'Small (छोटा)',
    'examples': [
      {'word': 'Minimum', 'usage': 'न्यूनतम'},
      {'word': 'Minor', 'usage': 'नाबालिग/गौण'},
      {'word': 'Minute', 'usage': 'सूक्ष्म/मिनट'},
    ],
  },
  {
    'root': 'Miss/Mit',
    'meaning': 'Send (भेजना)',
    'examples': [
      {'word': 'Transmit', 'usage': 'प्रसारित करना'},
      {'word': 'Mission', 'usage': 'अभियान'},
      {'word': 'Dismiss', 'usage': 'खारिज करना'},
    ],
  },
  {
    'root': 'Mob/Mot',
    'meaning': 'Move (गति)',
    'examples': [
      {'word': 'Mobile', 'usage': 'मोबाइल/गतिशील'},
      {'word': 'Motion', 'usage': 'गति'},
      {'word': 'Promote', 'usage': 'बढ़ावा देना'},
    ],
  },
  {
    'root': 'Mon/Mono',
    'meaning': 'One (एक)',
    'examples': [
      {'word': 'Monopoly', 'usage': 'एकाधिकार'},
      {'word': 'Monologue', 'usage': 'एकालाप'},
      {'word': 'Monotonous', 'usage': 'नीरस'},
    ],
  },
  {
    'root': 'Mor/Mort',
    'meaning': 'Death (मृत्यु)',
    'examples': [
      {'word': 'Mortal', 'usage': 'नश्वर'},
      {'word': 'Mortuary', 'usage': 'मुर्दाघर'},
      {'word': 'Immortal', 'usage': 'अमर'},
    ],
  },
  {
    'root': 'Morph',
    'meaning': 'Shape (आकार)',
    'examples': [
      {'word': 'Metamorphosis', 'usage': 'कायापलट'},
      {'word': 'Amorphous', 'usage': 'अनाकार'},
      {'word': 'Morphology', 'usage': 'आकृति विज्ञान'},
    ],
  },
  {
    'root': 'Multi',
    'meaning': 'Many (अनेक)',
    'examples': [
      {'word': 'Multiply', 'usage': 'गुणा करना'},
      {'word': 'Multitude', 'usage': 'भीड़'},
      {'word': 'Multipurpose', 'usage': 'बहुउद्देशीय'},
    ],
  },
  {
    'root': 'Mut',
    'meaning': 'Change (बदलना)',
    'examples': [
      {'word': 'Mutate', 'usage': 'उत्परिवर्तित होना'},
      {'word': 'Immutable', 'usage': 'अपरिवर्तनीय'},
      {'word': 'Commute', 'usage': 'आवागमन करना'},
    ],
  },
  {
    'root': 'Nat',
    'meaning': 'Born (जन्म)',
    'examples': [
      {'word': 'Native', 'usage': 'मूल निवासी'},
      {'word': 'Natural', 'usage': 'प्राकृतिक'},
      {'word': 'Prenatal', 'usage': 'जन्मपूर्व'},
    ],
  },
  {
    'root': 'Nav',
    'meaning': 'Ship (जहाज)',
    'examples': [
      {'word': 'Navy', 'usage': 'नौसेना'},
      {'word': 'Navigate', 'usage': 'नेविगेट करना'},
      {'word': 'Naval', 'usage': 'नौसैनिक'},
    ],
  },
  {
    'root': 'Neg',
    'meaning': 'Deny (मना करना)',
    'examples': [
      {'word': 'Negative', 'usage': 'नकारात्मक'},
      {'word': 'Negate', 'usage': 'नकारना'},
      {'word': 'Renege', 'usage': 'वचन से मुकर जाना'},
    ],
  },
  {
    'root': 'Neo',
    'meaning': 'New (नया)',
    'examples': [
      {'word': 'Neonatal', 'usage': 'नवजात'},
      {'word': 'Neophyte', 'usage': 'नौसिखिया'},
      {'word': 'Neoclassical', 'usage': 'नवशास्त्रीय'},
    ],
  },
  {
    'root': 'Nom/Nym',
    'meaning': 'Name (नाम)',
    'examples': [
      {'word': 'Nominate', 'usage': 'मनोनीत करना'},
      {'word': 'Synonym', 'usage': 'पर्यायवाची'},
      {'word': 'Pseudonym', 'usage': 'उपनाम'},
    ],
  },
  {
    'root': 'Not',
    'meaning': 'Mark (निशान)',
    'examples': [
      {'word': 'Note', 'usage': 'टिप्पणी'},
      {'word': 'Notify', 'usage': 'सूचित करना'},
      {'word': 'Notable', 'usage': 'उल्लेखनीय'},
    ],
  },
  {
    'root': 'Nov',
    'meaning': 'New (नया)',
    'examples': [
      {'word': 'Novel', 'usage': 'उपन्यास/नया'},
      {'word': 'Innovate', 'usage': 'नवाचार करना'},
      {'word': 'Renovate', 'usage': 'नवीनीकरण करना'},
    ],
  },
  {
    'root': 'Num',
    'meaning': 'Number (संख्या)',
    'examples': [
      {'word': 'Numeral', 'usage': 'अंक'},
      {'word': 'Numerous', 'usage': 'बहुल'},
      {'word': 'Enumerate', 'usage': 'गणना करना'},
    ],
  },
  {
    'root': 'Ob',
    'meaning': 'Against (विरुद्ध)',
    'examples': [
      {'word': 'Obstacle', 'usage': 'बाधा'},
      {'word': 'Obstruct', 'usage': 'रोकना'},
      {'word': 'Object', 'usage': 'आपत्ति करना'},
    ],
  },
  {
    'root': 'Oct',
    'meaning': 'Eight (आठ)',
    'examples': [
      {'word': 'Octopus', 'usage': 'ऑक्टोपस'},
      {'word': 'Octagon', 'usage': 'अष्टकोण'},
      {'word': 'October', 'usage': 'अक्टूबर'},
    ],
  },
  {
    'root': 'Omni',
    'meaning': 'All (सभी)',
    'examples': [
      {'word': 'Omnipotent', 'usage': 'सर्वशक्तिमान'},
      {'word': 'Omnipresent', 'usage': 'सर्वव्यापी'},
      {'word': 'Omniscient', 'usage': 'सर्वज्ञ'},
    ],
  },
  {
    'root': 'Oper',
    'meaning': 'Work (काम)',
    'examples': [
      {'word': 'Operate', 'usage': 'संचालित करना'},
      {'word': 'Cooperate', 'usage': 'सहयोग करना'},
      {'word': 'Operator', 'usage': 'चालक'},
    ],
  },
  {
    'root': 'Opt',
    'meaning': 'Eye, Best (आंख, श्रेष्ठ)',
    'examples': [
      {'word': 'Optical', 'usage': 'थोक/दृश्य'},
      {'word': 'Optometrist', 'usage': 'नेत्र रोग विशेषज्ञ'},
      {'word': 'Optimist', 'usage': 'आशावादी'},
    ],
  },
  {
    'root': 'Ortho',
    'meaning': 'Straight (सीधा)',
    'examples': [
      {'word': 'Orthodontist', 'usage': 'दंत चिकित्सक'},
      {'word': 'Orthodox', 'usage': 'रूढ़िवादी'},
      {'word': 'Orthopedics', 'usage': 'हड्डी रोग विज्ञान'},
    ],
  },
  {
    'root': 'Pan',
    'meaning': 'All (सभी)',
    'examples': [
      {'word': 'Panorama', 'usage': 'परिदृश्य'},
      {'word': 'Pandemic', 'usage': 'महामारी'},
      {'word': 'Panacea', 'usage': 'रामबाण इलाज'},
    ],
  },
  {
    'root': 'Pater',
    'meaning': 'Father (पिता)',
    'examples': [
      {'word': 'Paternal', 'usage': 'पैतृक'},
      {'word': 'Paternity', 'usage': 'पितृत्व'},
      {'word': 'Patriarch', 'usage': 'कुलपिता'},
    ],
  },
  {
    'root': 'Path',
    'meaning': 'Feeling (भावना)',
    'examples': [
      {'word': 'Sympathy', 'usage': 'सहानुभूति'},
      {'word': 'Pathology', 'usage': 'रोग विज्ञान'},
      {'word': 'Apathy', 'usage': 'उदासीनता'},
    ],
  },
  {
    'root': 'Ped/Pod',
    'meaning': 'Foot (पैर)',
    'examples': [
      {'word': 'Pedestrian', 'usage': 'पैदल यात्री'},
      {'word': 'Tripod', 'usage': 'तिपाई'},
      {'word': 'Pedal', 'usage': 'पैडल'},
    ],
  },
  {
    'root': 'Pel/Puls',
    'meaning': 'Drive (धकेलना)',
    'examples': [
      {'word': 'Propel', 'usage': 'आगे बढ़ाना'},
      {'word': 'Compel', 'usage': 'मजबूर करना'},
      {'word': 'Repulsive', 'usage': 'प्रतिकारक'},
    ],
  },
  {
    'root': 'Pend',
    'meaning': 'Hang (लटकना)',
    'examples': [
      {'word': 'Pendulum', 'usage': 'लोलक'},
      {'word': 'Suspend', 'usage': 'निलंबित करना'},
      {'word': 'Depend', 'usage': 'निर्भर होना'},
    ],
  },
  {
    'root': 'Phon',
    'meaning': 'Sound (ध्वनि)',
    'examples': [
      {'word': 'Telephone', 'usage': 'टेलीफोन'},
      {'word': 'Symphony', 'usage': 'सिम्फनी'},
      {'word': 'Phonetics', 'usage': 'ध्वनि विज्ञान'},
    ],
  },
  {
    'root': 'Photo',
    'meaning': 'Light (प्रकाश)',
    'examples': [
      {'word': 'Photograph', 'usage': 'तस्वीर'},
      {'word': 'Photosynthesis', 'usage': 'प्रकाश संश्लेषण'},
      {'word': 'Photon', 'usage': 'फोटॉन'},
    ],
  },
  {
    'root': 'Phys',
    'meaning': 'Nature (प्रकृति)',
    'examples': [
      {'word': 'Physics', 'usage': 'भौतिक विज्ञान'},
      {'word': 'Physical', 'usage': 'शारीरिक'},
      {'word': 'Physician', 'usage': 'चिकित्सक'},
    ],
  },
  {
    'root': 'Plac',
    'meaning': 'Please (प्रसन्न करना)',
    'examples': [
      {'word': 'Placid', 'usage': 'शांत'},
      {'word': 'Placate', 'usage': 'शांत करना'},
      {'word': 'Complacent', 'usage': 'आत्मसंतुष्ट'},
    ],
  },
  {
    'root': 'Plur',
    'meaning': 'More (अधिक)',
    'examples': [
      {'word': 'Plural', 'usage': 'बहुवचन'},
      {'word': 'Plurality', 'usage': 'बहुलता'},
      {'word': 'Surplus', 'usage': 'अधिशेष'},
    ],
  },
  {
    'root': 'Poli',
    'meaning': 'City (शहर)',
    'examples': [
      {'word': 'Metropolis', 'usage': 'महानगर'},
      {'word': 'Police', 'usage': 'पुलिस'},
      {'word': 'Politics', 'usage': 'राजनीति'},
    ],
  },
  {
    'root': 'Poly',
    'meaning': 'Many (अनेक)',
    'examples': [
      {'word': 'Polygon', 'usage': 'बहुभुज'},
      {'word': 'Polytheism', 'usage': 'बहुदेववाद'},
      {'word': 'Polyglot', 'usage': 'बहुभाषी'},
    ],
  },
  {
    'root': 'Pon/Pos',
    'meaning': 'Put, Place (रखना)',
    'examples': [
      {'word': 'Postpone', 'usage': 'स्थगित करना'},
      {'word': 'Position', 'usage': 'स्थान'},
      {'word': 'Opponent', 'usage': 'प्रतिद्वंद्वी'},
    ],
  },
  {
    'root': 'Pop',
    'meaning': 'People (लोग)',
    'examples': [
      {'word': 'Population', 'usage': 'जनसंख्या'},
      {'word': 'Popular', 'usage': 'लोकप्रिय'},
      {'word': 'Populous', 'usage': 'घनी आबादी वाला'},
    ],
  },
  {
    'root': 'Port',
    'meaning': 'Carry (ले जाना)',
    'examples': [
      {'word': 'Portable', 'usage': 'पोर्टेबल'},
      {'word': 'Transport', 'usage': 'परिवहन'},
      {'word': 'Export', 'usage': 'निर्यात'},
    ],
  },
  {
    'root': 'Post',
    'meaning': 'After (बाद में)',
    'examples': [
      {'word': 'Postpone', 'usage': 'स्थगित करना'},
      {'word': 'Postscript', 'usage': 'उपसंहार (P.S.)'},
      {'word': 'Postmeridian', 'usage': 'अपराह्न (PM)'},
    ],
  },
  {
    'root': 'Pot',
    'meaning': 'Power (शक्ति)',
    'examples': [
      {'word': 'Potential', 'usage': 'संभावना/क्षमता'},
      {'word': 'Potent', 'usage': 'शक्तिशाली'},
      {'word': 'Omnipotent', 'usage': 'सर्वशक्तिमान'},
    ],
  },
  {
    'root': 'Pre',
    'meaning': 'Before (पहले)',
    'examples': [
      {'word': 'Prepare', 'usage': 'तैयार करना'},
      {'word': 'Predict', 'usage': 'भविष्यवाणी करना'},
      {'word': 'Preamble', 'usage': 'प्रस्तावना'},
    ],
  },
  {
    'root': 'Prim',
    'meaning': 'First (प्रथम)',
    'examples': [
      {'word': 'Primary', 'usage': 'प्राथमिक'},
      {'word': 'Primitive', 'usage': 'आदिम'},
      {'word': 'Prime', 'usage': 'प्रधान'},
    ],
  },
  {
    'root': 'Pro',
    'meaning': 'Forward (आगे)',
    'examples': [
      {'word': 'Proceed', 'usage': 'आगे बढ़ना'},
      {'word': 'Project', 'usage': 'परियोजना'},
      {'word': 'Promote', 'usage': 'बढ़ावा देना'},
    ],
  },
  {
    'root': 'Psych',
    'meaning': 'Mind (मन)',
    'examples': [
      {'word': 'Psychology', 'usage': 'मनोविज्ञान'},
      {'word': 'Psychiatrist', 'usage': 'मनोचिकित्सक'},
      {'word': 'Psychic', 'usage': 'मानसिक/दैवीय'},
    ],
  },
  {
    'root': 'Pug',
    'meaning': 'Fight (लड़ाई)',
    'examples': [
      {'word': 'Pugnacious', 'usage': 'झगड़ालू'},
      {'word': 'Repugnant', 'usage': 'अरुचिकर/घृणास्पद'},
      {'word': 'Impugn', 'usage': 'चुनौती देना'},
    ],
  },
  {
    'root': 'Put',
    'meaning': 'Think (सोचना)',
    'examples': [
      {'word': 'Compute', 'usage': 'गणना करना'},
      {'word': 'Reputation', 'usage': 'प्रतिष्ठा'},
      {'word': 'Dispute', 'usage': 'विवाद'},
    ],
  },
  {
    'root': 'Pyr',
    'meaning': 'Fire (आग)',
    'examples': [
      {'word': 'Pyrotechnics', 'usage': 'आतिशबाजी'},
      {'word': 'Pyromania', 'usage': 'दहनोन्माद'},
      {'word': 'Pyre', 'usage': 'चिता'},
    ],
  },
  {
    'root': 'Quad',
    'meaning': 'Four (चार)',
    'examples': [
      {'word': 'Quadrangle', 'usage': 'चौकोर'},
      {'word': 'Quadruplet', 'usage': 'चार बच्चे एक साथ'},
      {'word': 'Quadrant', 'usage': 'चतुर्थांश'},
    ],
  },
  {
    'root': 'Quest/Quer',
    'meaning': 'Ask, Seek (पूछना/खोजना)',
    'examples': [
      {'word': 'Question', 'usage': 'प्रश्न'},
      {'word': 'Inquest', 'usage': 'तहकीकात'},
      {'word': 'Query', 'usage': 'पूछताछ'},
    ],
  },
  {
    'root': 'Radi',
    'meaning': 'Ray (किरण)',
    'examples': [
      {'word': 'Radiation', 'usage': 'विकिरण'},
      {'word': 'Radio', 'usage': 'रेडियो'},
      {'word': 'Radius', 'usage': 'त्रिज्या'},
    ],
  },
  {
    'root': 'Re',
    'meaning': 'Again, Back (पुनः, वापस)',
    'examples': [
      {'word': 'Review', 'usage': 'समीक्षा करना'},
      {'word': 'Return', 'usage': 'वापस आना'},
      {'word': 'Rewrite', 'usage': 'पुनः लिखना'},
    ],
  },
  {
    'root': 'Rect',
    'meaning': 'Straight (सीधा)',
    'examples': [
      {'word': 'Correct', 'usage': 'सही'},
      {'word': 'Rectangle', 'usage': 'आयत'},
      {'word': 'Rectify', 'usage': 'सुधारना'},
    ],
  },
  {
    'root': 'Retro',
    'meaning': 'Backward (पीछे)',
    'examples': [
      {'word': 'Retroactive', 'usage': 'पूर्वप्रभावी'},
      {'word': 'Retrospect', 'usage': 'पुनरावलोकन'},
      {'word': 'Retrograde', 'usage': 'पीछे हटनेवाला'},
    ],
  },
  {
    'root': 'Rid/Ris',
    'meaning': 'Laugh (हंसना)',
    'examples': [
      {'word': 'Ridicule', 'usage': 'उपहास'},
      {'word': 'Risible', 'usage': 'हंसने योग्य'},
      {'word': 'Derision', 'usage': 'मजाक'},
    ],
  },
  {
    'root': 'Rog',
    'meaning': 'Ask (पूछना)',
    'examples': [
      {'word': 'Interrogate', 'usage': 'पूछताछ करना'},
      {'word': 'Prerogative', 'usage': 'विशेषाधिकार'},
      {'word': 'Derogatory', 'usage': 'अपमानजनक'},
    ],
  },
  {
    'root': 'Rupt',
    'meaning': 'Break (टूटना)',
    'examples': [
      {'word': 'Rupture', 'usage': 'टूटना'},
      {'word': 'Interrupt', 'usage': 'बाधा डालना'},
      {'word': 'Bankrupt', 'usage': 'दिवालिया'},
    ],
  },
  {
    'root': 'Sacr/Sanct',
    'meaning': 'Holy (पवित्र)',
    'examples': [
      {'word': 'Sacred', 'usage': 'पवित्र'},
      {'word': 'Sanctuary', 'usage': 'अभयारण्य/गर्भगृह'},
      {'word': 'Sacrifice', 'usage': 'बलिदान'},
    ],
  },
  {
    'root': 'Sci',
    'meaning': 'Know (जानना)',
    'examples': [
      {'word': 'Science', 'usage': 'विज्ञान'},
      {'word': 'Conscience', 'usage': 'विवेक'},
      {'word': 'Omniscient', 'usage': 'सर्वज्ञ'},
    ],
  },
  {
    'root': 'Scop',
    'meaning': 'See (देखना)',
    'examples': [
      {'word': 'Microscope', 'usage': 'सूक्ष्मदर्शी'},
      {'word': 'Telescope', 'usage': 'दूरबीन'},
      {'word': 'Periscope', 'usage': 'परिदर्शी'},
    ],
  },
  {
    'root': 'Scrib/Script',
    'meaning': 'Write (लिखना)',
    'examples': [
      {'word': 'Scribble', 'usage': 'घसीट कर लिखना'},
      {'word': 'Scripture', 'usage': 'धर्मग्रंथ'},
      {'word': 'Prescription', 'usage': 'नुस्खा'},
    ],
  },
  {
    'root': 'Sec/Sect',
    'meaning': 'Cut (काटना)',
    'examples': [
      {'word': 'Section', 'usage': 'अनुभाग'},
      {'word': 'Dissect', 'usage': 'चीर-फाड़ करना'},
      {'word': 'Insect', 'usage': 'कीड़ा'},
    ],
  },
  {
    'root': 'Sed/Sid/Sess',
    'meaning': 'Sit (बैठना)',
    'examples': [
      {'word': 'Sedentary', 'usage': 'बैठने वाला'},
      {'word': 'Session', 'usage': 'सत्र'},
      {'word': 'President', 'usage': 'अध्यक्ष/राष्ट्रपति'},
    ],
  },
  {
    'root': 'Semi',
    'meaning': 'Half (आधा)',
    'examples': [
      {'word': 'Semicircle', 'usage': 'अर्धवृत्त'},
      {'word': 'Semifinal', 'usage': 'सेमीफाइनल'},
      {'word': 'Semiconscious', 'usage': 'अर्धचेतन'},
    ],
  },
  {
    'root': 'Sen',
    'meaning': 'Old (बूढ़ा)',
    'examples': [
      {'word': 'Senior', 'usage': 'वरिष्ठ'},
      {'word': 'Senator', 'usage': 'सीनेटर'},
      {'word': 'Senile', 'usage': 'सठियाया हुआ'},
    ],
  },
  {
    'root': 'Sens/Sent',
    'meaning': 'Feel (महसूस करना)',
    'examples': [
      {'word': 'Sense', 'usage': 'समझ/इंद्रिय'},
      {'word': 'Sentiment', 'usage': 'भावना'},
      {'word': 'Sensible', 'usage': 'समझदार'},
    ],
  },
  {
    'root': 'Sequ/Secut',
    'meaning': 'Follow (अनुसरण करना)',
    'examples': [
      {'word': 'Sequence', 'usage': 'अनुक्रम'},
      {'word': 'Consequence', 'usage': 'परिणाम'},
      {'word': 'Execute', 'usage': 'निष्पादित करना'},
    ],
  },
  {
    'root': 'Serv',
    'meaning': 'Save, Serve (बचाना, सेवा करना)',
    'examples': [
      {'word': 'Service', 'usage': 'सेवा'},
      {'word': 'Preserve', 'usage': 'संरक्षण करना'},
      {'word': 'Servant', 'usage': 'नौकर'},
    ],
  },
  {
    'root': 'Sign',
    'meaning': 'Mark (चिह्न)',
    'examples': [
      {'word': 'Signal', 'usage': 'संकेत'},
      {'word': 'Signature', 'usage': 'हस्ताक्षर'},
      {'word': 'Significant', 'usage': 'महत्वपूर्ण'},
    ],
  },
  {
    'root': 'Simil/Simul',
    'meaning': 'Like (समान)',
    'examples': [
      {'word': 'Similar', 'usage': 'समान'},
      {'word': 'Simulate', 'usage': 'स्वांग करना'},
      {'word': 'Simultaneous', 'usage': 'एक साथ'},
    ],
  },
  {
    'root': 'Sol',
    'meaning': 'Alone, Sun (अकेला, सूर्य)',
    'examples': [
      {'word': 'Solo', 'usage': 'एकल'},
      {'word': 'Solitary', 'usage': 'एकांत'},
      {'word': 'Solar', 'usage': 'सौर'},
    ],
  },
  {
    'root': 'Son',
    'meaning': 'Sound (ध्वनि)',
    'examples': [
      {'word': 'Sonic', 'usage': 'ध्वनि विषयक'},
      {'word': 'Sonar', 'usage': 'सोनार'},
      {'word': 'Resonance', 'usage': 'गूंज'},
    ],
  },
  {
    'root': 'Soph',
    'meaning': 'Wise (बुद्धिमान)',
    'examples': [
      {'word': 'Philosophy', 'usage': 'दर्शनशास्त्र'},
      {'word': 'Sophisticated', 'usage': 'जटिल/विवेकी'},
      {'word': 'Sophomore', 'usage': 'द्वितीय वर्ष का छात्र'},
    ],
  },
  {
    'root': 'Spec/Spic',
    'meaning': 'Look (देखना)',
    'examples': [
      {'word': 'Spectacle', 'usage': 'तमाशा'},
      {'word': 'Inspect', 'usage': 'निरीक्षण करना'},
      {'word': 'Suspicious', 'usage': 'संदेहजनक'},
    ],
  },
  {
    'root': 'Spir',
    'meaning': 'Breathe (सांस लेना)',
    'examples': [
      {'word': 'Spirit', 'usage': 'आत्मा'},
      {'word': 'Respire', 'usage': 'सांस लेना'},
      {'word': 'Inspire', 'usage': 'प्रेरित करना'},
    ],
  },
  {
    'root': 'Sta/Sti',
    'meaning': 'Stand (खड़ा होना)',
    'examples': [
      {'word': 'Stable', 'usage': 'स्थिर'},
      {'word': 'Station', 'usage': 'स्टेशन'},
      {'word': 'Static', 'usage': 'स्थिर'},
    ],
  },
  {
    'root': 'Strict/String',
    'meaning': 'Bind (बांधना)',
    'examples': [
      {'word': 'Strict', 'usage': 'सख्त'},
      {'word': 'Constrict', 'usage': 'संकुचित करना'},
      {'word': 'Stringent', 'usage': 'कठोर'},
    ],
  },
  {
    'root': 'Struct',
    'meaning': 'Build (बनाना)',
    'examples': [
      {'word': 'Structure', 'usage': 'संरचना'},
      {'word': 'Construct', 'usage': 'निर्माण करना'},
      {'word': 'Destruct', 'usage': 'नष्ट करना'},
    ],
  },
  {
    'root': 'Sub',
    'meaning': 'Under (नीचे)',
    'examples': [
      {'word': 'Submarine', 'usage': 'पनडुब्बी'},
      {'word': 'Subway', 'usage': 'भूमिगत मार्ग'},
      {'word': 'Substitute', 'usage': 'विकल्प'},
    ],
  },
  {
    'root': 'Super/Sur',
    'meaning': 'Over (ऊपर)',
    'examples': [
      {'word': 'Superior', 'usage': 'श्रेष्ठ'},
      {'word': 'Supervise', 'usage': 'पर्यवेक्षण करना'},
      {'word': 'Surface', 'usage': 'सतह'},
    ],
  },
  {
    'root': 'Sym/Syn',
    'meaning': 'Together (साथ)',
    'examples': [
      {'word': 'Symphony', 'usage': 'सिम्फनी'},
      {'word': 'Synchronize', 'usage': 'समय मिलाना'},
      {'word': 'Synonym', 'usage': 'पर्यायवाची'},
    ],
  },
  {
    'root': 'Tact/Tang',
    'meaning': 'Touch (छूना)',
    'examples': [
      {'word': 'Tactile', 'usage': 'स्पर्श-संबंधी'},
      {'word': 'Tangible', 'usage': 'मूर्त/स्पर्शगम्य'},
      {'word': 'Contact', 'usage': 'संपर्क'},
    ],
  },
  {
    'root': 'Tele',
    'meaning': 'Far (दूर)',
    'examples': [
      {'word': 'Telephone', 'usage': 'टेलीफोन'},
      {'word': 'Television', 'usage': 'टेलीविजन'},
      {'word': 'Telepathy', 'usage': 'दूरसंवेदन'},
    ],
  },
  {
    'root': 'Temp',
    'meaning': 'Time (समय)',
    'examples': [
      {'word': 'Temporary', 'usage': 'अस्थायी'},
      {'word': 'Contemporary', 'usage': 'समकालीन'},
      {'word': 'Tempo', 'usage': 'ताल'},
    ],
  },
  {
    'root': 'Ten/Tin/Tent',
    'meaning': 'Hold (पकड़ना)',
    'examples': [
      {'word': 'Tenant', 'usage': 'किरायेदार'},
      {'word': 'Continue', 'usage': 'जारी रखना'},
      {'word': 'Detention', 'usage': 'नज़रबंदी'},
    ],
  },
  {
    'root': 'Term',
    'meaning': 'End (अंत)',
    'examples': [
      {'word': 'Terminal', 'usage': 'अंतिम'},
      {'word': 'Terminate', 'usage': 'समाप्त करना'},
      {'word': 'Determine', 'usage': 'निर्धारित करना'},
    ],
  },
  {
    'root': 'Terr',
    'meaning': 'Earth (पृथ्वी)',
    'examples': [
      {'word': 'Terrain', 'usage': 'भू-भाग'},
      {'word': 'Territory', 'usage': 'क्षेत्र'},
      {'word': 'Terrestrial', 'usage': 'स्थलीय'},
    ],
  },
  {
    'root': 'Test',
    'meaning': 'Witness (गवाह)',
    'examples': [
      {'word': 'Testify', 'usage': 'गवाही देना'},
      {'word': 'Testimony', 'usage': 'साक्ष्य'},
      {'word': 'Protest', 'usage': 'विरोध करना'},
    ],
  },
  {
    'root': 'The',
    'meaning': 'God (भगवान)',
    'examples': [
      {'word': 'Theology', 'usage': 'धर्मशास्त्र'},
      {'word': 'Atheist', 'usage': 'नास्तिक'},
      {'word': 'Theism', 'usage': 'आस्तिकता'},
    ],
  },
  {
    'root': 'Therm',
    'meaning': 'Heat (गर्मी)',
    'examples': [
      {'word': 'Thermometer', 'usage': 'तापमापी'},
      {'word': 'Thermal', 'usage': 'तापीय'},
      {'word': 'Hypothermia', 'usage': 'अल्पताप'},
    ],
  },
  {
    'root': 'Tort',
    'meaning': 'Twist (मोड़ना)',
    'examples': [
      {'word': 'Torture', 'usage': 'यातना'},
      {'word': 'Distort', 'usage': 'विकृत करना'},
      {'word': 'Contort', 'usage': 'मरोड़ना'},
    ],
  },
  {
    'root': 'Tox',
    'meaning': 'Poison ( जहर)',
    'examples': [
      {'word': 'Toxic', 'usage': 'विषाक्त'},
      {'word': 'Intoxicate', 'usage': 'नशा करना'},
      {'word': 'Detox', 'usage': 'विषहरण'},
    ],
  },
  {
    'root': 'Tract',
    'meaning': 'Pull (खींचना)',
    'examples': [
      {'word': 'Tractor', 'usage': 'ट्रैक्टर'},
      {'word': 'Attract', 'usage': 'आकर्षित करना'},
      {'word': 'Contract', 'usage': 'अनुबंध/सिकुड़ना'},
    ],
  },
  {
    'root': 'Trans',
    'meaning': 'Across (उस पार)',
    'examples': [
      {'word': 'Transport', 'usage': 'परिवहन'},
      {'word': 'Transfer', 'usage': 'स्थानांतरण'},
      {'word': 'Translate', 'usage': 'अनुवाद करना'},
    ],
  },
  {
    'root': 'Tri',
    'meaning': 'Three (तीन)',
    'examples': [
      {'word': 'Triangle', 'usage': 'त्रिभुज'},
      {'word': 'Tricycle', 'usage': 'तिपहिया साइकिल'},
      {'word': 'Tripod', 'usage': 'तिपाई'},
    ],
  },
  {
    'root': 'Trib',
    'meaning': 'Pay, Bestow (देना/प्रदान करना)',
    'examples': [
      {'word': 'Tribute', 'usage': 'श्रद्धांजलि'},
      {'word': 'Contribute', 'usage': 'योगदान देना'},
      {'word': 'Distribute', 'usage': 'वितरित करना'},
    ],
  },
  {
    'root': 'Ult',
    'meaning': 'Last (अंतिम)',
    'examples': [
      {'word': 'Ultimate', 'usage': 'अंतिम/सर्वश्रेष्ठ'},
      {'word': 'Ultimatum', 'usage': 'अंतिम चेतावनी'},
      {'word': 'Penultimate', 'usage': 'उपांत्य (अंतिम से एक पहले)'},
    ],
  },
  {
    'root': 'Umbr',
    'meaning': 'Shadow (छाया)',
    'examples': [
      {'word': 'Umbrella', 'usage': 'छाता'},
      {'word': 'Umbrage', 'usage': 'साया/नाराजगी'},
      {'word': 'Penumbra', 'usage': 'उपछाया'},
    ],
  },
  {
    'root': 'Uni',
    'meaning': 'One (एक)',
    'examples': [
      {'word': 'Uniform', 'usage': 'वर्दी/एकसमान'},
      {'word': 'Unify', 'usage': 'एक करना'},
      {'word': 'Unique', 'usage': 'अद्वितीय'},
    ],
  },
  {
    'root': 'Urb',
    'meaning': 'City (शहर)',
    'examples': [
      {'word': 'Urban', 'usage': 'शहरी'},
      {'word': 'Suburb', 'usage': 'उपनगर'},
      {'word': 'Urbanize', 'usage': 'शहरीकरण करना'},
    ],
  },
  {
    'root': 'Vac',
    'meaning': 'Empty (खाली)',
    'examples': [
      {'word': 'Vacant', 'usage': 'खाली'},
      {'word': 'Vacation', 'usage': 'छुट्टी'},
      {'word': 'Evacuate', 'usage': 'खाली करना'},
    ],
  },
  {
    'root': 'Val',
    'meaning': 'Worth, Strong (मूल्य, मजबूत)',
    'examples': [
      {'word': 'Value', 'usage': 'मूल्य'},
      {'word': 'Valid', 'usage': 'मान्य'},
      {'word': 'Valor', 'usage': 'वीरता'},
    ],
  },
  {
    'root': 'Ven/Vent',
    'meaning': 'Come (आना)',
    'examples': [
      {'word': 'Venue', 'usage': 'स्थान'},
      {'word': 'Event', 'usage': 'घटना'},
      {'word': 'Adventure', 'usage': 'साहसिक कार्य'},
    ],
  },
  {
    'root': 'Ver',
    'meaning': 'Truth (सत्य)',
    'examples': [
      {'word': 'Verify', 'usage': 'सत्यापित करना'},
      {'word': 'Verdict', 'usage': 'फैसला'},
      {'word': 'Veracity', 'usage': 'सच्चाई'},
    ],
  },
  {
    'root': 'Vers/Vert',
    'meaning': 'Turn (मुड़ना)',
    'examples': [
      {'word': 'Reverse', 'usage': 'उल्टा'},
      {'word': 'Convert', 'usage': 'बदलना'},
      {'word': 'Introvert', 'usage': 'अंतर्मुखी'},
    ],
  },
  {
    'root': 'Via',
    'meaning': 'Way (रास्ता)',
    'examples': [
      {'word': 'Viaduct', 'usage': 'सेतु'},
      {'word': 'Deviate', 'usage': 'भटकना'},
      {'word': 'Obvious', 'usage': 'स्पष्ट'},
    ],
  },
  {
    'root': 'Vic/Vinc',
    'meaning': 'Conquer (जीतना)',
    'examples': [
      {'word': 'Victory', 'usage': 'जीत'},
      {'word': 'Convince', 'usage': 'आश्वस्त करना'},
      {'word': 'Invincible', 'usage': 'अजेय'},
    ],
  },
  {
    'root': 'Vid/Vis',
    'meaning': 'See (देखना)',
    'examples': [
      {'word': 'Video', 'usage': 'वीडियो'},
      {'word': 'Visual', 'usage': 'दृश्य'},
      {'word': 'Invisible', 'usage': 'अदृश्य'},
    ],
  },
  {
    'root': 'Viv/Vit',
    'meaning': 'Life (जीवन)',
    'examples': [
      {'word': 'Vivid', 'usage': 'जीवंत'},
      {'word': 'Vital', 'usage': 'महत्वपूर्ण'},
      {'word': 'Revive', 'usage': 'पुनर्जीवित करना'},
    ],
  },
  {
    'root': 'Voc/Vok',
    'meaning': 'Voice, Call (आवाज़, पुकारना)',
    'examples': [
      {'word': 'Vocal', 'usage': 'मुखर'},
      {'word': 'Vocabulary', 'usage': 'शब्दावली'},
      {'word': 'Invoke', 'usage': 'आह्वान करना'},
    ],
  },
  {
    'root': 'Vol',
    'meaning': 'Will (इच्छा)',
    'examples': [
      {'word': 'Volunteer', 'usage': 'स्वयंसेवक'},
      {'word': 'Voluntary', 'usage': 'स्वैच्छिक'},
      {'word': 'Benevolent', 'usage': 'परोपकारी'},
    ],
  },
  {
    'root': 'Volv/Volu',
    'meaning': 'Roll (घूमना)',
    'examples': [
      {'word': 'Revolve', 'usage': 'घूमना'},
      {'word': 'Evolve', 'usage': 'विकसित होना'},
      {'word': 'Volume', 'usage': 'मात्रा/आयतन'},
    ],
  },
  {
    'root': 'Vor',
    'meaning': 'Eat (खाना)',
    'examples': [
      {'word': 'Voracious', 'usage': 'पेटू/लालची'},
      {'word': 'Carnivore', 'usage': 'मांसाहारी'},
      {'word': 'Herbivore', 'usage': 'शाकाहारी'},
    ],
  },
  {
    'root': 'Zo',
    'meaning': 'Animal (जानवर)',
    'examples': [
      {'word': 'Zoo', 'usage': 'चिड़ियाघर'},
      {'word': 'Zoology', 'usage': 'जंतु विज्ञान'},
      {'word': 'Zodiac', 'usage': 'राशि चक्र'},
    ],
  },
];
