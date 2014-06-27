# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(username: "Arieh Smith", email: "arieh.smith@gmail.com")
u1.password = "stuffy"
u1.save!

u2 = User.new(username: "conz", email: "conz@conz.com")
u2.password = "stuffy"
u2.save!

for i in 1..50 do
  u = User.new(username: i.to_s, email: "#{i.to_s}@example.com")
  u.password = "stuffy"
  u.save!
end

a1 = u1.articles.create!(title: "Google’s latest empire-building tactic: cheap phones",
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

Article.all.each do |article|
  num = (1..52).to_a.sample
  User.all.each_with_index do |user, index|
    Vote.create!(user_id: user.id, article_id: article.id)
    break if num == index
  end
end