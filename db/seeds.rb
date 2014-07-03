# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = ["Tech","Google","Mobile", "Computing", "Lifehack", "Science", "Humor"]

title_first_half = [
  "Amazon's strategy in streaming television",
  "China's version of PayPal",
  "Goldman Sachs' short-term outlook",
  "The reason behind the universal appeal of tattoos",
  "A billion-dollar smartphone factory in Vietnam",
  "Pakistan's national airline",
  "Japan's military power",
  "Angela Merkel",
  "Facebook's social experiment",
  "Mario Draghi's idea of richer ECB communication",
  "The decline of the Hollywood comedy",
  "Mobile advertising",
  "US media ad spending",
  "The frothiest segment of the US beer market",
  "The head of one of the biggest US military intelligence agencies",
  "Mumbai's brand new $700-million metro",
  "A Chinese billionaire",
  "America's intellectual and future capital"
]

title_second_half = [
  "is beginning to take shape",
  "is mounting one of the biggest challenges to Chinese banks",
  "is not looking pretty",
  "signals growth is rebounding",
  "is massively increasing ice cream costs",
  "has appeal to right-wing nationalists",
  "is growing hostile to the insular nature of the presidency",
  "moves markets like Mario Draghi",
  "is completely justified in feeling cranky",
  "is a little tired",
  "is gloomy about the economy",
  "is already using Facebook to track your mood",
  "can find you",
  "completely misses a systemic problem that Vancouver faces",
  "affects the long term prospects of this great city",
  "is looking for a place to park its money",
  "is mostly determined by a simple factor"
]

titles = []

while titles.length < 100
  title = "#{title_first_half.sample} #{title_second_half.sample}"
  titles.push(title) unless titles.include? title
end

paragraphs = [
  "In the same way that observing the behavior of some subatomic particles changes the behavior of those particles (called the observer effect), watching the tweets and posts of targets can create an environment where people tweet less. You poison your own well by drawing from it. That happens on an individual level in terms of specific human targets but also on a larger, societal level.",
  "The thing that never sits quite right with post scarcity economics, though, at least the very little that I’ve read, is that it’s always sort of an all or nothing affair: you either don’t have enough of anything or you have enough of everything. Thinking of this as a mental exercise is kind of fun, I think, but in reality it seems to me that getting from point A — a scarcity economy — to point B — post scarcity — is going to be a long, complicated journey as some things become more abundant in some places, while other things are still scarce.",
  "Sometimes swaddled in silvery capes or attended to by ghostly minders, the android-like devices call to mind the Victorian mothers who would hide underneath blankets to keep their toddlers from squirming during portraits. Collected together, the Google-camera selfies are at turns unsettling, revealing, and absurd—unintentionally upstaging the art they’re meant to quietly document.",
  "In January, police were called in and 15 people were injured after hundreds of construction workers clashed with security guards at a Samsung smartphone factory in the northern province of Thai Nguyen. The fight was allegedly triggered either by a dispute over whether a worker could bring in their own meals, or over a employee who was late to work. In either case it resulted in guards beating a man unconscious with clubs, according to local media reports, and workers throwing bricks and stones, and setting shipping containers on fire.",
  "British journalists are in a tizzy this morning. It started yesterday, when James Ball of the Guardian wrote a gently seething comment piece about notices his paper received from Google, warning it that six articles would no longer be listed on the search engine’s European sites. This was followed by a post from the BBC’s economics editor, Robert Peston, who complained that Google had removed “this example of my journalism.",
  "From New Zealand’s Maori people to Angeleno gangsters, most cultures incorporate some form of tattooing. But “where the skin is too dark to tattoo, there is scarification,” Rainier said. When he would visit African societies that practice scarification, and he would ask locals who they thought was the most beautiful woman or the most handsome man, they would inevitably point to the most scarred.",
  "The truth is that the decline of the comedy is a trend that has been under way for a while now. Hollywood’s reluctance to make comedies is also explained by declining DVD sales, itself caused by growth in streaming services like Netflix (which are commissioning their own original content, including comedy television).",
  "Facebook has always “manipulated” the results shown in its users’ News Feeds by filtering and personalizing for relevance. But this weekend, the social giant seemed to cross a line, when it announced that it engineered emotional responses two years ago in an “emotional contagion” experiment, published in the Proceedings of the National Academy of Sciences (PNAS).",
  "The mobile advertising market has grown rapidly over the years, but it’s still a sliver of overall ad spending—5.7% of the $171 billion total ad market in the US last year, according to eMarketer. This despite the fact that Americans spend an ever-growing amount of time on their phones—about 19% of total media consumption time last year, also via eMarketer.",
  "The increase in production is mostly due to small local or regional breweries.  Craft breweries such as Bell’s near Kalamazoo, Michigan, and Lagunitas in Petaluma, California, have more than doubled their shipments over five years, while major brands are generally flat though. Of course, some of those small craft brewers end up stocking up a corporate giant’s liquor cabinet.",
  "With the flood of new connected services and devices on the market, knowing how future users might hook them together or find unexpected new uses is a challenge, no matter what Silicon Valley’s confident young bucks may tell us. A service called IFTTT is giving us an interesting peek into the practical, clever and slightly weird ways people want to use the Internet of Things (IoT).",
  "It took eight years and Rs 4,321 crore (about $720 million) to build the Mumbai Metro. But less than a month after starting operations, the newest mass transit system in India’s financial capital—built by a consortium led by billionaire Anil Ambani’s Reliance Infrastructure—has spectacularly failed in the face of Mumbai’s legendary monsoon rains."]

u1 = User.new(username: "arieh", email: "arieh.smith@gmail.com")
u1.password = "stuffy"
u1.save!

u2 = User.new(username: "conz", email: "conz@conz.com")
u2.password = "stuffy"
u2.save!

for i in 3..52 do
  u = User.new(username: "User #{i}", email: "#{i.to_s}@example.com")
  u.password = "stuffy"
  u.save!
end

100.times do |num|
  u1.articles.create!(title: titles.pop, body: "#{paragraphs.sample}\n\n#{paragraphs.sample}\n\n#{paragraphs.sample}", created_at: "2014-05-05 12:00")
end

a1 = u1.articles.create!(title: "Google's latest empire-building tactic: cheap phones",
body: 
"Here’s the thing about those cheap sub-$100 smartphones that nobody tells you: They’re awful. Many of them use ageing hardware to run old versions of Android. People tend to use them like regular phones—except to surf Facebook when they’ve got a Wi-Fi connection.

Google knows this. That’s why the first thing the company announced at its never-ending developer conference yesterday, June 25, was AndroidOne, a set of design specifications that will allow makers of cheap smartphones to quickly produce better cheap phones without spending too much time or money on research and development. The first few phone-makers in the program are all Indian. No surprise there: With its huge population, low smartphone penetration, and young population, India is the single most attractive market for phone companies today. The average selling price of a smartphone from Micromax, the company whose phone Google showcased in its presentation, is somewhere around $110, a co-founder told the Wall Street Journal (paywall)

So it makes sense that Google wants these phones to improve. It’s all very well getting millions of first-time smartphone owners onto Android but there seems little point—for Google’s business empire—if those people aren’t spending money in Google’s multifarious stores or spending their time searching for stuff (and viewing ads) on Google services.

The AndroidOne initiative then is not so much an act of keen business development in the the parts of the world that are about to become hugely important to any ambitious tech firm, but a defensive move from Google, in three very different ways.

First, it is a way of ensuring that it doesn’t fall victim to competition from Windows Phone. You may laugh, but Windows Phones running Microsoft software have proved popular in emerging markets, outselling the iPhone in 24 countries, including India. Microsoft earlier this year started giving away the Windows Phone operating system for free to some smartphone makers in India. The company Microsoft chose to launch a low-cost Windows Phone earlier this month is the same as Google’s choice on stage: Micromax (paywall). The Nokia brand name is held in high esteem in India, which certainly makes life easier for Microsoft, given it acquired Nokia’s handset business.

Second, cheap Android devices are fine for a first-time buyer, but nobody aspires to own a Micromax device. If Google can improve the experience on cheap devices, maybe it can ensure the loyalty of its new users, ensuring they don’t take their wallets to Apple or Microsoft. Moreover, the Android branding on the cheap phones also elevates their status. Indians can be sniffy about homegrown brands. They still hold large multinationals in some degree of esteem.

Third, imposing some structure on the messy market for cheap Android phones makes the platform more attractive to developers. At the moment, Android has a fragmentation problem. That puts developers off. But if the phones get better, more people download apps and spend money on them, and there is some consistency—imposed, for example, by making Google-sanctioned phones such as the Nexus range the standard—they may feel more confident about coming to Android’s vast user base first. What Google is trying to do is kickstart a virtuous cycle.

Google may have sold Motorola, but it very much remains a device-maker. As Apple has shown, that’s the best to ensure a decent experience for users. The difference is that Google has dispensed with the fiddly business of actually making the things and having to distribute and market them. Instead, it is providing guidelines for the hardware, assuming ever-greater control over the software (while at the same time touting it as an open system) and leaving all the risk to the makers. It is a smart move.",
created_at: "2014-06-25 19:36",
photo: "https://s3.amazonaws.com/TopazProd/sundar-pichai-google-io.jpg")

a2 = u1.articles.create!(title: "Everything Is Broken",
body: 
"Once upon a time, a friend of mine accidentally took over thousands of computers. He had found a vulnerability in a piece of software and started playing with it. In the process, he figured out how to get total administration access over a network. He put it in a script, and ran it to see what would happen, then went to bed for about four hours. Next morning on the way to work he checked on it, and discovered he was now lord and master of about 50,000 computers. After nearly vomiting in fear he killed the whole thing and deleted all the files associated with it. In the end he said he threw the hard drive into a bonfire. I can’t tell you who he is because he doesn’t want to go to Federal prison, which is what could have happened if he’d told anyone that could do anything about the bug he’d found. Did that bug get fixed? Probably eventually, but not by my friend. This story isn’t extraordinary at all. Spend much time in the hacker and security scene, you’ll hear stories like this and worse.

It’s hard to explain to regular people how much technology barely works, how much the infrastructure of our lives is held together by the IT equivalent of baling wire.

Computers, and computing, are broken.

For a bunch of us, especially those who had followed security and the warrantless wiretapping cases, the revelations weren’t big surprises. We didn’t know the specifics, but people who keep an eye on software knew computer technology was sick and broken. We’ve known for years that those who want to take advantage of that fact tend to circle like buzzards. The NSA wasn’t, and isn’t, the great predator of the internet, it’s just the biggest scavenger around. It isn’t doing so well because they are all powerful math wizards of doom.",
created_at: "2014-06-21 11:36",
photo: "https://s3.amazonaws.com/TopazProd/1-8j1yslZ0PFPnHF-Dpk-jyg.jpeg")

a3 = u1.articles.create!(title: "7 Things You Need To Stop Doing To Be More Productive, Backed By Science",
body: 
"When I was 17 years old, I used to work and study for about 20 hours a day. I went to school, did my homework during breaks and managed a not-for-profit organization at night. At that time, working hard landed me countless national campaigns, opportunities to work with A-list organizations and a successful career. As I got older, I started thinking differently. I realized that working harder is not always the right path to success. Sometimes, working less can actually produce better results.

When I was 17 years old, I used to work and study for about 20 hours a day. I went to school, did my homework during breaks and managed a not-for-profit organization at night. At that time, working hard landed me countless national campaigns, opportunities to work with A-list organizations and a successful career. As I got older, I started thinking differently. I realized that working harder is not always the right path to success. Sometimes, working less can actually produce better results.

The key to success is not hard working but smart working.

There’s a notable distinction between being busy and being productive. Being busy doesn’t necessarily mean you’re being productive. Being productive is less about time management and more on managing your energy. It is the business of life. We need to learn how to spend the least amount of energy to get the most benefits. I am so lucky to work with an amazing team here at Filemobile. Everyone always challenges me and helps me sort my priorities to become more productive. I learned to reduce my work week from 80 hours to 40 hours, and get a lot more work done in the process. In other words, less is more.",
created_at: "2014-05-29 18:21",
photo: "https://s3.amazonaws.com/TopazProd/productivity.jpg")

b1 = u2.articles.create!(title: "Studies Show That Words Look Strange When You Look At Them For Too Long",
body: "After coding for 4 hours straight, Carolyn Jiang** thought she was seeing things. The word “follow,” which was once a trivial word in her vernacular, suddenly looked odd. Was F-O-L-L-O-W really the right way to spell “follow”? Even enunciating the syllables out loud sounded like she was speaking in foreign tongues.

This phenomenon is a common problem plaguing youths today as they spend hours on the computer reading articles, Facebook statuses, and tweets. Researchers at the University of Phoenix conducted a study with 100 students across all schools to look into this mind-boggling illusion. They locked each student in a room for 24 hours with nothing but a book and a computer. Naturally, as students of this day and age are wont to do, each student spent the first 6 hours mindlessly surfing the Internet without breaks. Eventually, he or she turned to the book in order to rest his or her eyes, but researchers soon found that the subjects began acting as if they were going crazy. Eyes bulging as they read the pages of the Charles Dickens novel, some even started talking to themselves, repeating certain words over and over in different intonations with nothing sounding right.
  
The researchers concluded that kids need to go outside.

**name changed to hide identity",
created_at: "2014-06-26 14:45",
photo: "https://s3.amazonaws.com/TopazProd/Semantic-e1382262909875.jpg")

b2 = u2.articles.create!(
title: "13 Problems Only App Academy Students Understand",
body: 
"1. Having your solo day on the first day of a new curriculum.

2. Being stationed at the island desk near the door where the floor is slanted but then getting assigned a boring partner who won't roll around with you.

3. It's 12:45pm and Jonathan and Tommy are still helping students and haven't realized the time yet.

4. Getting a partner who is super into pushing to Git.

5. Your code is working fine one minute, but after changing just one line, everything breaks.

6. Getting assigned to Station 4 on the day you don't really feel like doing the work.

7. Forgetting to sign out of Hipchat and realizing that someone else could be reading all your private messages.

8. Waiting too long for the elevator and having a dilemma about taking the stairs because you don't know if the elevator might come right at that moment.

9. Not getting enough sleep the night before and then Jonathan dims the lights for his CSS demo.

10. Your friends asking you to hang out the night before an assessment.

11. Your friends asking you to hang out the weekend you have to do the whole Hartl tutorial/read the whole SQL book/read the Effective Javascript book.

12. Having to read the Effective Javascript book.

13. Having only one spec left on the assessment and not being able to figure out how to pass it.",
created_at: "2014-06-26 15:00",
photo: "https://s3.amazonaws.com/TopazProd/photo.JPG")

b2.comments.create!(text: "LOL", author_id: 1, p_id: 1)
b2.comments.create!(text: "omg that's hilarious", author_id: 2, p_id: 1)
b2.comments.create!(text: "i can sympathize", author_id: 2, p_id: 1)
b2.comments.create!(text: "yeah that is a super slanty floor", author_id: 1, p_id: 2)
b2.comments.create!(text: "for certain!", author_id: 2, p_id: 2)

a1.tags.create!(name: "tech")
a1.tags.create!(name: "google")
a1.tags.create!(name: "mobile")
a2.tags.create!(name: "computing")
a2.taglist = "computing tech"
a3.tags.create!(name: "lifehack")

b1.tags.create!(name: "science")
b2.tags.create!(name: "humor")
b2.taglist = "humor tech"

[a1,a2,a3,b1,b2].each do |article|
  num = (11..52).to_a.sample
  
  User.all.each_with_index do |user, index|
    next if user.id == 1 || user.id == 2
    Vote.create!(user_id: user.id, article_id: article.id)
    break if num == index
  end
end

(Article.all - [a1,a2,a3,b1,b2]).each do |article|
  article.taglist = tags.sample;
  num = (0..10).to_a.sample
  User.all.each_with_index do |user, index|
    unless user.id == 1 || user.id == 2
      Vote.create!(user_id: user.id, article_id: article.id)
    end
    break if num == index
  end
end