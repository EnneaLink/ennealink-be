# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friendship.destroy_all
User.destroy_all
Enneagram.destroy_all
MyersBrigg.destroy_all

e1 = Enneagram.create(number: 1, name: 'The Reformer', description: 'Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to maintain high standards, but can slip into being critical and perfectionistic.', link: 'https://www.enneagraminstitute.com/type-1')
e2 = Enneagram.create(number: 2, name: 'The Helper', description: 'Twos are empathetic, sincere, and warm-hearted... They are well-meaning and driven to be close to others, but can slip into doing things for others in order to be needed.', link: 'https://www.enneagraminstitute.com/type-2')
e3 = Enneagram.create(number: 3, name: 'The Achiever', description: 'Threes are self-assured, attractive, and charming... They are diplomatic and poised, but can also be overly concerned with their image and what others think of them.', link: 'https://www.enneagraminstitute.com/type-3')
e4 = Enneagram.create(number: 4, name: 'The Individualist', description: 'Fours are self-aware, sensitive, and reserved. They are emotionally honest, creative, and personal, but can also be moody and self-conscious.', link: 'https://www.enneagraminstitute.com/type-4')
e5 = Enneagram.create(number: 5, name: 'The Investigator', description: 'Fives are alert, insightful, and curious... Independent, innovative, and inventive, they can also become preoccupied with their thoughts and imaginary constructs.', link: 'https://www.enneagraminstitute.com/type-5')
e6 = Enneagram.create(number: 6, name: 'The Loyalist', description: 'Sixes are reliable, hard-working, responsible, and trustworthy. Excellent troubleshooters, they foresee problems and foster cooperation, but can also become defensive, evasive, and anxious.', link: 'https://www.enneagraminstitute.com/type-6')
e7 = Enneagram.create(number: 7, name: 'The Enthusiast', description: 'Sevens are extroverted, optimistic, versatile, and spontaneous. Playful, high-spirited, and practical, they can also misapply their many talents, becoming over-extended, scattered, and undisciplined.', link: 'https://www.enneagraminstitute.com/type-7')
e8 = Enneagram.create(number: 8, name: 'The Challenger', description: 'Eights are self-confident, strong, and assertive. Protective, resourceful, straight-talking, and decisive, but can also be ego-centric and domineering.', link: 'https://www.enneagraminstitute.com/type-8')
e9 = Enneagram.create(number: 9, name: 'The Peacemaker', description: 'Nines are accepting, trusting, and stable. They are usually creative, optimistic, and supportive, but can also be too willing to go along with others to keep the peace.', link: 'https://www.enneagraminstitute.com/type-9')

mb1 = MyersBrigg.create(type_of: 'ISTJ', name: 'The Logistician', description: 'These people tend to be reserved yet willful, with a rational outlook on life. They compose their actions carefully and carry them out with methodical purpose.', link: 'https://www.16personalities.com/istj-personality')
mb2 = MyersBrigg.create(type_of: 'ISFJ', name: 'The Defender', description: 'These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives.', link: 'https://www.16personalities.com/isfj-personality')
mb3 = MyersBrigg.create(type_of: 'INFJ', name: 'The Advocate', description: 'These people tend to embrace big ideas and actions that reflect their sense of hope and goodwill toward others. Their vibrant energy can flow in many directions.', link: 'https://www.16personalities.com/infj-personality')
mb4 = MyersBrigg.create(type_of: 'INTJ', name: 'The Architect', description: 'These thoughtful tacticians love perfecting the details of life, applying creativity and rationality to everything they do. Their inner world is often a private, complex one.', link: 'https://www.16personalities.com/intj-personality')
mb5 = MyersBrigg.create(type_of: 'ISTP', name: 'The Virtuoso', description: 'They tend to have an individualistic mindset, pursuing goals without needing much external connection. They engage in life with inquisitiveness and personal skill, varying their approach as needed.', link: 'https://www.16personalities.com/istp-personality')
mb6 = MyersBrigg.create(type_of: 'ISFP', name: 'The Adventurer', description: 'They tend to have open minds, approaching life, new experiences, and people with grounded warmth. Their ability to stay in the moment helps them uncover exciting potentials.', link: 'https://www.16personalities.com/isfp-personality')
mb7 = MyersBrigg.create(type_of: 'INFP', name: 'The Mediator', description: 'These rare personality types tend to be quiet, open-minded, and imaginative, and they apply a caring and creative approach to everything they do.', link: 'https://www.16personalities.com/infp-personality')
mb8 = MyersBrigg.create(type_of: 'INTP', name: 'The Logician', description: 'These flexible thinkers enjoy taking an unconventional approach to many aspects of life. They often seek out unlikely paths, mixing willingness to experiment with personal creativity.', link: 'https://www.16personalities.com/intp-personality')
mb9 = MyersBrigg.create(type_of: 'ESTP', name: 'The Entrepreneur', description: 'They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits.', link: 'https://www.16personalities.com/estp-personality')
mb10 = MyersBrigg.create(type_of: 'ESFP', name: 'The Entertainer', description: 'These people love vibrant experiences, engaging in life eagerly and taking pleasure in discovering the unknown. They can be very social, often encouraging others into shared activities.', link: 'https://www.16personalities.com/esfp-personality')
mb11 = MyersBrigg.create(type_of: 'ENFP', name: 'The Campaigner', description: 'These people tend to embrace big ideas and actions that reflect their sense of hope and goodwill toward others. Their vibrant energy can flow in many directions.', link: 'https://www.16personalities.com/enfp-personality')
mb12 = MyersBrigg.create(type_of: 'ENTP', name: 'The Debater', description: 'They tend to be bold and creative, deconstructing and rebuilding ideas with great mental agility. They pursue their goals vigorously despite any resistance they might encounter.', link: 'https://www.16personalities.com/entp-personality')
mb13 = MyersBrigg.create(type_of: 'ESTJ', name: 'The Executive', description: 'They possess great fortitude, emphatically following their own sensible judgment. They often serve as a stabilizing force among others, able to offer solid direction amid adversity.', link: 'https://www.16personalities.com/estj-personality')
mb14 = MyersBrigg.create(type_of: 'ESFJ', name: 'The Consul', description: 'They are attentive and people-focused, and they enjoy taking part in their social community. Their achievements are guided by decisive values, and they willingly offer guidance to others.', link: 'https://www.16personalities.com/esfj-personality')
mb15 = MyersBrigg.create(type_of: 'ENFJ', name: 'The Protagonist', description: 'These warm, forthright types love helping others, and they tend to have strong ideas and values. They back their perspective with the creative energy to achieve their goals.', link: 'https://www.16personalities.com/enfj-personality')
mb16 = MyersBrigg.create(type_of: 'ENTJ', name: 'The Commander', description: 'They are decisive people who love momentum and accomplishment. They gather information to construct their creative visions but rarely hesitate for long before acting on them.', link: 'https://www.16personalities.com/entj-personality')


u1 = User.create(email: 'dev@2105.com', username: 'funbucket', password: 'password', enneagram_id: e1.id, myers_brigg_id: mb6.id)
# u2 = create(:user)
# u3 = create(:user)
# u4 = create(:user)
# u5 = create(:user)

# f1 = Friendship.create(user_id: u1.id, friend_id: u2.id)
# f2 = Friendship.create(user_id: u1.id, friend_id: u3.id)
# f3 = Friendship.create(user_id: u1.id, friend_id: u4.id)
