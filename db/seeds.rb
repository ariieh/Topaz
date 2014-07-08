# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(username: "arieh", email: "arieh.smith@gmail.com", provider: "facebook", uid: ENV["ARI_FB_UID"])
u1.password = "stuffy"
u1.save!

u2 = User.new(username: "conz", email: "conz@conz.com")
u2.password = "stuffy"
u2.save!

for i in 3..103 do
  u = User.new(username: Faker::Name.name, email: Faker::Internet.email)
  u.password = "stuffy"
  u.save!
end

u = User.new(username: "Demo", email: "demo@example.com")
u.password = "demopassword"
u.save!

articles_hash = [
{title: "Google's latest empire-building tactic: cheap phones",
body: 
"Here’s the thing about those cheap sub-$100 smartphones that nobody tells you: They’re awful. Many of them use ageing hardware to run old versions of Android. People tend to use them like regular phones—except to surf Facebook when they’ve got a Wi-Fi connection.

Google knows this. That’s why the first thing the company announced at its never-ending developer conference yesterday, June 25, was AndroidOne, a set of design specifications that will allow makers of cheap smartphones to quickly produce better cheap phones without spending too much time or money on research and development. The first few phone-makers in the program are all Indian. No surprise there: With its huge population, low smartphone penetration, and young population, India is the single most attractive market for phone companies today. The average selling price of a smartphone from Micromax, the company whose phone Google showcased in its presentation, is somewhere around $110, a co-founder told the Wall Street Journal (paywall)

So it makes sense that Google wants these phones to improve. It’s all very well getting millions of first-time smartphone owners onto Android but there seems little point—for Google’s business empire—if those people aren’t spending money in Google’s multifarious stores or spending their time searching for stuff (and viewing ads) on Google services.

The AndroidOne initiative then is not so much an act of keen business development in the the parts of the world that are about to become hugely important to any ambitious tech firm, but a defensive move from Google, in three very different ways.

First, it is a way of ensuring that it doesn’t fall victim to competition from Windows Phone. You may laugh, but Windows Phones running Microsoft software have proved popular in emerging markets, outselling the iPhone in 24 countries, including India. Microsoft earlier this year started giving away the Windows Phone operating system for free to some smartphone makers in India. The company Microsoft chose to launch a low-cost Windows Phone earlier this month is the same as Google’s choice on stage: Micromax (paywall). The Nokia brand name is held in high esteem in India, which certainly makes life easier for Microsoft, given it acquired Nokia’s handset business.

Second, cheap Android devices are fine for a first-time buyer, but nobody aspires to own a Micromax device. If Google can improve the experience on cheap devices, maybe it can ensure the loyalty of its new users, ensuring they don’t take their wallets to Apple or Microsoft. Moreover, the Android branding on the cheap phones also elevates their status. Indians can be sniffy about homegrown brands. They still hold large multinationals in some degree of esteem.

Third, imposing some structure on the messy market for cheap Android phones makes the platform more attractive to developers. At the moment, Android has a fragmentation problem. That puts developers off. But if the phones get better, more people download apps and spend money on them, and there is some consistency—imposed, for example, by making Google-sanctioned phones such as the Nexus range the standard—they may feel more confident about coming to Android’s vast user base first. What Google is trying to do is kickstart a virtuous cycle.

Google may have sold Motorola, but it very much remains a device-maker. As Apple has shown, that’s the best to ensure a decent experience for users. The difference is that Google has dispensed with the fiddly business of actually making the things and having to distribute and market them. Instead, it is providing guidelines for the hardware, assuming ever-greater control over the software (while at the same time touting it as an open system) and leaving all the risk to the makers. It is a smart move.",
photo: "https://s3.amazonaws.com/TopazProd/sundar-pichai-google-io.jpg",
taglist: "tech google business mobile"},

{title: "Everything Is Broken",
body: 
"Once upon a time, a friend of mine accidentally took over thousands of computers. He had found a vulnerability in a piece of software and started playing with it. In the process, he figured out how to get total administration access over a network. He put it in a script, and ran it to see what would happen, then went to bed for about four hours. Next morning on the way to work he checked on it, and discovered he was now lord and master of about 50,000 computers. After nearly vomiting in fear he killed the whole thing and deleted all the files associated with it. In the end he said he threw the hard drive into a bonfire. I can’t tell you who he is because he doesn’t want to go to Federal prison, which is what could have happened if he’d told anyone that could do anything about the bug he’d found. Did that bug get fixed? Probably eventually, but not by my friend. This story isn’t extraordinary at all. Spend much time in the hacker and security scene, you’ll hear stories like this and worse.

It’s hard to explain to regular people how much technology barely works, how much the infrastructure of our lives is held together by the IT equivalent of baling wire.

Computers, and computing, are broken.

For a bunch of us, especially those who had followed security and the warrantless wiretapping cases, the revelations weren’t big surprises. We didn’t know the specifics, but people who keep an eye on software knew computer technology was sick and broken. We’ve known for years that those who want to take advantage of that fact tend to circle like buzzards. The NSA wasn’t, and isn’t, the great predator of the internet, it’s just the biggest scavenger around. It isn’t doing so well because they are all powerful math wizards of doom.",

photo: "https://s3.amazonaws.com/TopazProd/1-8j1yslZ0PFPnHF-Dpk-jyg.jpeg",
taglist: "computing tech"},

{title: "7 Things You Need To Stop Doing To Be More Productive, Backed By Science",
body: 
"When I was 17 years old, I used to work and study for about 20 hours a day. I went to school, did my homework during breaks and managed a not-for-profit organization at night. At that time, working hard landed me countless national campaigns, opportunities to work with A-list organizations and a successful career. As I got older, I started thinking differently. I realized that working harder is not always the right path to success. Sometimes, working less can actually produce better results.

When I was 17 years old, I used to work and study for about 20 hours a day. I went to school, did my homework during breaks and managed a not-for-profit organization at night. At that time, working hard landed me countless national campaigns, opportunities to work with A-list organizations and a successful career. As I got older, I started thinking differently. I realized that working harder is not always the right path to success. Sometimes, working less can actually produce better results.

The key to success is not hard working but smart working.

There’s a notable distinction between being busy and being productive. Being busy doesn’t necessarily mean you’re being productive. Being productive is less about time management and more on managing your energy. It is the business of life. We need to learn how to spend the least amount of energy to get the most benefits. I am so lucky to work with an amazing team here at Filemobile. Everyone always challenges me and helps me sort my priorities to become more productive. I learned to reduce my work week from 80 hours to 40 hours, and get a lot more work done in the process. In other words, less is more.",

photo: "https://s3.amazonaws.com/TopazProd/productivity.jpg",
taglist: "lifehack"},

{title: "Egypt’s new ruler wants to be international lenders’ favorite autocrat",
body:
"Abdel Fattah al-Sisi has made his first major move since formally becoming Egypt’s president in early June. He is starting to eliminate fuel and food subsidies that have crippled the country’s budget. On July 4, prices on 80-octane petrol rose by 78% to 1.60 Egyptian pounds ($0.22) a liter, and 92-octane petrol is up 40%.  Natural gas for vehicles rises by 175%, The Guardian reported. Electricity subsidies will be eliminated within five years, with prices rising this month.

Sisi’s authoritarian credentials are in no doubt: He overthrew the elected Islamist president, Mohamed Morsi, last year and implemented military rule before winning an election by 97% against virtually no opposition in May; his regime has sentenced over 200 members of Morsi’s Muslim Brotherhood to death. But in policy terms, he’s a bit of a black box. He visited a woman sexually assaulted in Tahrir Square and suggested he will give up half of his wealth and cut his own salary by half, but has not said much about how he plans to reshape the turbulent country.

After so many months of unrest, harsh austerity measures might seem a risky move for Sisi. But since the 2011 revolution that overthrew Hosni Mubarak at the height of the Arab Spring, Egypt’s foreign-exchange reserves have dropped by 60%, the economy has shrunk, and the Egyptian pound has fallen sharply. “You are talking about nearly half of the population being in a state of poverty,” Samir Radwan, the finance minister in the months after Mubarak’s overthrow, told The Guardian. Public debt now exceeds 100% of GDP. Surging inflation and falling revenues from tourism have pushed the budget to breaking point.",

photo: "http://img.qz.com/2014/07/egypt.jpg?w=1160",
taglist: "politics egypt"},

{title: "A simple solution to the crisis in Crimea: Let Russia buy it",
body:
"There are occasions in international diplomacy when the deal-making skills of an investment banker can creatively solve problems that are beyond the tool-kit of career diplomats and politicians. The crisis created by Vladimir Putin’s unilateral annexation of the Crimea qualifies as a situation that may have had a solution if American diplomacy had been able to think out of the box.

What if President Obama, in the famously long conversation he had with Putin before events escalated, had said: “We respect that Russia has legitimate security interests in the Crimea, as well as its ethnic and cultural ties to the majority of the Crimean people whose interests are not aligned with the Ukrainians in the west. At the same time, Ukraine has legitimate interests in protecting its sovereignty and we, the US, want to ensure that international law is respected and borders are not unilaterally rearranged by stronger countries. Therefore we propose that Russia offers to “buy” the Crimea for $100 billion to be paid over 10 years. We will persuade the leadership of the Ukraine to accept this proposal and voluntarily cede the Crimea to Russia.”

Instead, during that call, Putin went on about the Ukrainian “fascists” who were threatening the life and property of the Russian-speaking people in Crimea and his solemn duty to protect them. President Obama defended the new Ukrainian leadership and denied any such risks, threatening Russia with sanctions for violating international law. The two leaders talked past one another and there was no way of creating an agreement. Since the US was not willing to go to war with Russia over Crimea, the consensus narrative is that nothing else could have been done.",

photo: "http://img.qz.com/2014/07/rtr3t7rl.jpg?w=1160",
taglist: "politics russia"},

{title: "Why Apple just hired a Swiss-watch salesman",
body:
"Last year, Apple poached Angela Ahrendts, the CEO of Burberry, a British purveyor of luxury-goods. Today, Apple added a senior sales director from Tag Heuer, a Swiss purveyor of luxury watches, CNBC reports, citing Jean-Claude Biver, the head of watch brands at LVMH, a company that owns lots of luxury-goods makers. They did not name the sales director.

The plan, an analyst at Bernstein told CNBC, was to get some help in marketing its watches as “Swiss made,” though the report didn’t mention whether that would involve assembling the product in Switzerland. (It is possible, considering there have been no leaked images, unlike the constant stream of pictures claiming to show prototypes of the iPhone 6, which are thought to originate in the supply chain in China.)

But more important is the choice of a man Tag Heuer over other makers of luxury goods. There appear to be two reasons. First, Tag Heuer is better known among people who aren’t luxury-watch buyers than many of its more expensive and more exclusive competitors. That has a lot to do with the company’s aggressive marketing and advertising. Tag Heuer sponsors the McLaren Formula One team, and uses local celebrities to endorse its watches on billboards in both rich countries and, crucially, poor ones.

Second, Tag Heuer isn’t just a watch company. Like Burberry—and, some might argue, Apple—it is a luxury goods company. Tag Heuer was one of the few Swiss watchmakers to realise that as people increasingly ditch their watches for phones, it may as well join them. It sells its Meridiist range of (not terribly smart) phones for $5,000 and up. “For decades, a beautiful watch was the most personal product on a person’s body – in the 21st century, that became the phone,” Christoph Behling, TAG Heuer’s chief designer and the man who made its phones, told the Financial Times (paywall).",

photo: "http://img.qz.com/2014/07/tag-heuer-watchmaking.jpg?w=1160",
taglist: "business tech apple"},

{title: "For a taste of Beijing pollution, head to California on July 4",
body:
"Fireworks have been part of American Independence Day celebrations since independence itself. John Adams started the tradition on July 3, 1776, the day after independence was declared (but a day before the declaration’s wording was agreed). He wrote to his wife that the event

“ought to be commemorated, as the Day of Deliverance by solemn Acts of Devotion to God Almighty. It ought to be solemnized with Pomp and Parade, with Shews, Games, Sports, Guns, Bells, Bonfires and Illuminations from one End of this Continent to the other from this Time forward forever more.”

“Illuminations” have been associated with the Fourth of July ever since. But while awesome, they are also dangerous, and not just because they cause thousands of injuries and several deaths a year, but also because they’re heavy polluters.

California’s San Joaquin Valley is among the most polluted areas in the US. Every year, monitors placed around the valley see levels of PM2.5—the fine particles that are the worst for your lungs, and can’t be blocked by ordinary dust masks—reach unhealthy levels after the fireworks. A study reported by ChinaDaily USA found that “within one hour of a fireworks display, levels of copper in the air increased six fold, potassium 11 fold, barium 12 times, magnesium 22 times and strontium a staggering 120 fold.”

Moreover, the ingredients that make the pretty colors in fireworks—such as compounds of barium (green), copper (blue), or lithium or strontium (red)—can be carcinogenic if they accumulate in the bloodstream. The Lancet warns that firework-generated pollution can have “great consequences for health,” particularly in areas where the levels of PM2.5 are already high. In many Chinese cities, the already-hazardous levels of pollution reach up to 40 times the US safety standard after fireworks.

Air pollution in the US isn’t yet at Chinese levels. What the San Joaquin Valley considers very dangerous is considered moderate in urban China. But it is hazardous nonetheless.",

photo: "http://img.qz.com/2014/07/rtr34lx7.jpg?w=1160",
taglist: "china politics"},

{title: "The world can’t seem to get enough German luxury cars",
body:
"Mercedes-Benz just reported the best six months of sales in its history, with deliveries through June up 13%, to more than 783,000 units. Although sales in its German home market were flat over the period, buyers in the company’s other key markets turned up in droves.

What’s particularly clear is that despite Chinese officialdom’s crackdown on luxury purchases by party bureaucrats, there are plenty of other buyers there keen on a Merc. China accounts for around 17% of Mercedes-Benz’s total unit sales, making it the company’s second-largest market, after the US (worth 19% of total sales).

Meanwhile, Audi reported its best-ever month of sales in China today, selling twice as many units as Mercedes in the first half of the year, although growth was half as fast (a mere 18% year-over-year). As in so many other luxury industries, German carmakers’ fortunes rely increasingly on Chinese consumers’ taste for the finer things.

But there are also plenty of encouraging developments in the West. Audi saw sales grow by 14% in the first half in America, just beating the not-too-shabby growth recorded by luxury market leader BMW.

And although times are tougher for carmakers in Europe, it’s the middle-of-the-road brands that have been hit hardest;  bargain and luxury models are still motoring ahead. The UK’s passenger car market expanded by 10% in the first half of the year, industry figures showed today, with the German luxury trio of Audi, BMW, and Mercedes-Benz all growing faster than the overall average.

The ultimate expression of the German auto giants’ bullishness, perhaps, is the recent unveiling of a new model in Mercedes’ top-of-the-line S-Class family. The “Pullman” will go on sale next year and run a cool $1 million, twice as much as its Rolls-Royce equivalent.",

photo: "http://img.qz.com/2014/07/rtr2yizo.jpg?w=1160",
taglist: "business"},

{title: "My startup failed, and this is what it feels like",
body:
"Over 90% of tech startups fail, but I never thought my baby, 99dresses, would be one of them.

If there is one thing that doing a startup has taught me, it’s that I am much more resilient than I could have ever imagined. Looking back, when I started 99dresses fresh out of high school I was very naive and had zero idea what I was doing. In fact, I didn’t even know what a startup was! I just knew I wanted to solve a problem I personally experienced: having a closet full of clothes but still nothing to wear.

Since then I’ve survived being stabbed in the back by cofounders, investment rounds falling through, massive technology fuckups that brought sales to a halt, visa problems, lack of money, lack of traction, lack of a team, hiring the wrong people, firing people I didn’t want to fire, lack of product-market fit, and everything else in between.

And yet I failed. I won many battles but I lost the war.

I take complete responsibility for this failure. Were other people involved in 99dresses? Of course. Was any of this their fault? Absolutely not.

The startup press glorify hardship. They glorify the Airbnbs who sold breakfast cereal to survive, and then turned their idea into a multi-billion dollar business. You rarely hear the raw stories of startups that persevered but ultimately failed — the emotional roller coaster of the founders, and why their startups didn’t work out.",

photo: "http://s4.nextupasia.com/wp-content/uploads/2013/01/Success-Failure-Sign.jpg",
taglist: "business tech"},

{title: "The Economics of Star Trek",
body:
"I promise this is about Star Trek. Sort of. Bear with me a moment.

I’ve been reading a lot about robots lately. When I read about robots, and the future, I can’t help but think about it in economic terms. And that inevitably turns my mind to the branch of economics called post scarcity economics. Traditional economics, of course, deals with the efficient allocation of inherently scarce materials. Post scarcity economics deals with the economics of economies that are no longer constrained by scarcity of materials — food, energy, shelter, etc.

The thing that never sits quite right with post scarcity economics, though, at least the very little that I’ve read, is that it’s always sort of an all or nothing affair: you either don’t have enough of anything or you have enough of everything. Thinking of this as a mental exercise is kind of fun, I think, but in reality it seems to me that getting from point A — a scarcity economy — to point B — post scarcity — is going to be a long, complicated journey as some things become more abundant in some places, while other things are still scarce.

What is needed is some sort of interim-, or proto-post scarcity economics.

More and more I find myself thinking we are, as a race, constrained by the economic models we have. We have capitalism, of course, the proverbial worst model except for every other one that dominates much of our planet right now. It’s definitely a scarcity-based system. Then we have the centrally planned systems of Communism and Marxism, not particularly effective, as it turns out. We have European-style socialist capitalism, but that’s still capitalism, and scarcity-based, albeit with a much more robust safety net than we have here in the US. Some Americans seem to think that a robust safety net somehow nullifies the distributed planning of capitalism. I’ll listen to them again when our schools are decent and our life span starts increasing again magically.

The key here, to me, is to start thinking about how economics would work when we decouple labor from reward. Does that make a system inherently communist? I don’t think it does. People work. They get paid. It is market driven, and not centrally planned. In reality,the market already basically dictates this, for who can claim that a Wall Street banker works more than a teacher? The only thing we really need to do is take this to a logical extreme: that people can still get paid doing zero work. This fear seems to be at the heart of most people who say that Europe is communist: if we give people so much welfare, some of them might stop working! Quelle Horreur!

It seems to me that with the rise of machines and robotics, advances in mining technology, energy technology (both fracking and green energy technologies), the obesity epidemic in the US, etc., that there are plenty of reasons to believe that we may be at the beginnings of a post scarcity economy. We have a surplus, no doubt. Of course, we still have legions of people in the world that are starving, and even people still here at home. But we actually have the capacity to feed them, to feed everyone, even now, even if we don’t have the will. It’s not a matter of scarcity; it’s a matter of the organization of labor and capital.",
photo: "https://upload.wikimedia.org/wikipedia/en/2/2d/ST_TOS_Cast.jpg",
taglist: "business"},

{title: "YouTube, following Netflix, is now publicly shaming internet providers for slow video",
body:
"When videos blur, buffer, or won’t play altogether, YouTube is now pinning the blame on your internet service provider.

“Experiencing interruptions?” reads the message in a blue bar underneath choppy video, as seen in the above screenshot. Clicking “find out why” brings you to Google’s new website, where it displays video playback quality for internet service providers (ISPs) in various countries. It’s like a report card for your delinquent ISP.

Google, which owns YouTube, has a strong interest in deflecting blame for poor video quality. The US government is considering new “net neutrality” regulations that could affect how information, particularly data-heavy streaming video, flows through the internet. ISPs would like to see more of the responsibility placed on video services like YouTube and Netflix, which account for a growing portion of internet traffic.

YouTube’s new notification is similar to one Netflix recently displayed to customers. “The Verizon network is crowded right now,” it said, for instance, when video playback was slow. Verizon called the message “deliberately misleading” and threatened legal action. Netflix defended its finger-pointing but stopped doing it last month.",
photo: "http://img.qz.com/2014/07/screen-shot-2014-07-04-at-10-13-16-pm.png",
taglist: "business tech"},

{title: "This is (probably) the best World Cup ever",
body:"The sheer verve and entertainment of this year’s World Cup has wowed even the most cynical. Even Brazilians, who greeted the tournament with street protests and for whom its economic benefits look dubious, have been putting their doubts to one side as their country marches towards the semi-final next week. Opinion polls show their pride in the World Cup has been rising—as has president Dilma Rousseff’s popularity ahead of an October election. And in terms of sport at least, there are signs this could be the best World Cup ever.

It is on track for the most goals ever. So far, before the quarter-finals, 154 goals have been scored, more than at the previous tournament in South Africa. The tally to beat is 171 goals scored at France ’98. There have also been 2.75 goals per game, more than any World Cup since 1982 in Spain.

This World Cup has already seen the lead change hands in 11 matches, more than in any modern tournament. Nothing makes soccer more exciting than when the balance of power shifts in the middle of the game.

The Latin American resurgence is real. This year featured four Latin American and four European teams. In 2010, it was four Latin American teams versus three from the center of power, Europe. In 1990, only one team from the continent made it through to the final eight. The biggest stage has proven that all the Argentines and Colombians and Brazilians are playing for the best European teams for a reason.

The best player in the world may be proving to be the best ever. Argentina’s Lionel Messi has singlehandedly forced his team into the quarter-finals and FiveThirtyEight’s analysis describes him as “impossible” in terms of goals, quality of passing, taking on defenders and every other measure. Messi has now proven everything there is to prove. Portugal’s Cristiano Ronaldo, not so much.",
photo: "http://img.qz.com/2014/07/brazil.jpg?w=1160",
taglist: "sports"},

{title: "Why Iran has a progressive drug rehab program alongside death sentences for drug crimes",
body:"There are stories some people might not expect to read about Iran—and its progressive drugs policy is one. As a number of countries begin to slowly reconsider their approach towards illicit drugs, following the avant-gardiste move of José Mujica’s Uruguay, the issue of drugs and treatment of drug abuse might be one where Iran could provide some meaningful contribution to the rest of the world.

The opium years

Iran has had a long history of drug use. Opium in particular has been part of the social, economic and cultural lives of Iranian people for about 15 decades. In the 20th century, the country has seen structural and ideological changes, and revolutions, war and cultural fervour have often coincided with changing tastes for drugs. Today, the country has arguably the highest number of drug users internationally—the official figure is 2-3 million people although others suggest it could be more like 10 million.

But this isn’t just about opium. Alongside well-established substances that also include hashish and alcohol are more modern and post-modern drugs such as heroin, crack and crystal meth, which in Persian is called shisheh or “glass.” Iran has a huge youth population—the average age is 25 for women and 24 for men – and an underground party scene is enjoyed by many in the urban, secularised and well-off younger generation. In 2012, Iran was the world’s fourth highest importer of pseudoephedrin, used to make crystal meth.

So besides being a major drug trafficking route, a large portion of Iran’s population is consuming various kinds of drugs, and increasingly producing its own synthetic drugs. The Islamic Republic has paradoxes, and drugs is one major example.",
photo: "http://img.qz.com/2014/07/rtr1sgdf.jpg?w=1160",
taglist: "iran"},

{title: "Why did the Queen use whisky instead of champagne to launch her new warship?",
body:"The Queen has named Britain’s largest warship after herself in an opening ceremony—by breaking a bottle of Islay malt whisky* over the ship’s hull. The 88-year-old monarch didn’t quite do it herself; she pushed a button on an automated contraption that smashed the bottle on her behalf against the 65,000-tonne aircraft carrier.

This is only the second recorded use of whisky to launch or name a new vessel, according to the Royal Navy. Traditionally, champagne has been used to inaugurate new ships while home-brewed beer is spilled on submarines. In Admiral Nelson’s era, at the peak of British naval power, brandy or madeira was probably used, the Navy said. The first time whisky was used was at the launch of the HMS Sutherland in 1996—for the record, it was Macallan Single Highland Malt whisky.

The Queen used a bottle of Bowmore Surf from the 235-year-old Bowmore Distillery on the island of Islay because it was the first distillery she had ever visited in an official capacity back in 1980, the Navy said. More likely, however, the choice of a whisky had a wee bit more to do with politics and the upcoming Scottish referendum on independence in September.

The naming ceremony was held at the Rosyth dockyard in Scotland, and the British prime minister took the opportunity to affirm the value of the United Kingdom staying together, and of course of having expensive and over-budget British military projects as clients for Scottish industry. Six shipyards and more than 10,000 people at more than 100 companies across the UK were used to build the HMS Queen Elizabeth. “It’s a really exciting day for Scotland, a great day for the United Kingdom and a sign of things to come if our country stays together,” David Cameron said.

For the Queen, the issue doesn’t make too much of a difference. She will stay on as head of state even if Scotland gains independence.

*Note: Irish and American varieties of the liquor are referred to as “whiskey” while Scotch whisky is spelt without the “e.”",
photo: "http://img.qz.com/2014/07/whisky.jpg?w=1160",
taglist: "uk politics"},

{title: "Don’t ask a young opera singer these three questions",
body:"It’s a common scenario: I meet someone new at a party and we get to talking about our work. “I’m an opera singer,” I say. “I recently finished my masters degree in vocal performance and am doing the audition and competition rounds, trying to break into the business.”

Without fail, one of the following statements will be made:

-”Wow! So are you going to be on American Idol?”

-”The Phantom of the Opera is my favorite!”

-”Have you heard of the amazing 14-year-old opera singer, Jackie Evancho?”

At this point, I decide whether I want to spend the next 20 minutes explaining why these statements are all non-sequiturs, or simply smile and say “sure!” because I don’t want to be a snob. Opera remains so steadfastly isolated from mainstream media that it’s hard to blame anyone for not knowing that a) American Idol is not a competition for opera singers, b) “The Phantom of the Opera,” despite having the word in its title, is not actually an opera, and c) Ms. Evancho, though talented, is not an opera singer.",
photo: "http://img.qz.com/2014/06/rtxagoy.jpg?w=1160",
taglist: "music"},

{title: "The only good penalty kick strategy is not having a strategy",
body:"A penalty taker in soccer should always kick to their strong side, because that gives him or her an advantage, right? But wait, then the goalie would expect the ball to come from that direction, and move to stop the shot. So the kicker should go to the weak side? Wrong again.

According to game theory—the study of how people make strategic decisions—the best strategy is to aim shots completely at random, a part of what’s known as the “mixed strategy.” The surprising thing is that, even in a world rife with eccentricity, superstition, and habit, top soccer strikers and goalies tend to behave exactly as the theory says they ought to.

A 2002 study (pdf) by Ignacio Palacios-Huerta, currently at the London School of Economics, put game theory to the test by analyzing thousands of penalty kicks taken in professional leagues. A penalty kick is a perfect game to test because, unlike in checkers—where there is an ideal move that can be made at any given juncture—a kick requires a randomized “mixed strategy.” That’s because there is no single strategic choice that will always work: shoot left enough and a goalie will be onto you, forcing you to change tactics.

But do soccer players actually act this way? “The results show that [players] act instinctively and intuitively as if they were programmed with great preciseness to correctly play this strategic game,” Palacios-Huerta says.",
photo: "http://img.qz.com/2014/07/netherlands-mexico-penalty.jpg?w=1160",
taglist: "sports"},

{title: "China may never embrace democracy, but American flag products rule on Taobao",
body:"What would China’s Communist Party have made of America’s fight for independence from Britain if it was around in the late 1700s? Probably not much, given China’s state-owned media outlets recent denunciation of any political movement that challenges the status quo, from Hong Kong’s protests to the Thai military coup to Ukraine’s ousting of its pro-Russia president.

But there is plenty of demand in China for products that sport the American stars and stripes, that famous symbol of US freedom and democracy. There are tens of thousands of flag-inspired items on Taobao, the Alibaba-owned online shopping mall, including a dizzying array of clothing. In fact, there is more merchandise on Taobao featuring the US flag than any other nation, including China.

(And yes, most of these products appear to be made in China.)

One popular American flag product, according to a Taobao search for the phrase “American flag” in English, is somewhat puzzling—an imported copy of “The American Flag,” a children’s book from a Minneapolis publisher. The book details the history of the flag, and a list of rules that flag-owners should follow, like “The flag should never touch anything below it” and “The flag should never be used as clothing.” At 106 RMB, or about $17, the book is about the same price on Taobao as it is on Amazon in the US.

Despite its popularity, China’s manufacturers and shoppers don’t seem to have embraced the book’s rules—most of what’s for sale is wearable. (Wearable American flag items, once scandalous in the US, are now worn so regularly that they’re considered “patriotic clothing.“)",
photo: "http://img.qz.com/2014/07/fireworks.jpg?w=1160",
taglist: "china business"},

{title: "Google can’t seem to decide whether to forget things or not",
body:"It’s all coming back to Google now. The search giant is re-instating links to news articles that it removed from its search results on July 2. That’s bringing even greater scrutiny on why the company decided to take them down in the first place.

In theory, the company was responding to a recent ruling (pdf) by the European Court of Justice that it must abide by European data protection laws (the “right to be forgotten”). Among the articles it removed was a piece about a Scottish soccer referee on the Guardian and Telegraph websites. It has not yet restored links to a 2007 article on the BBC’s website about a Merrill Lynch banker’s reckless investments. According to the court’s ruling, people may request that web pages about them be taken out of search results, but Google has to comply only if the material is not in the public interest, and is irrelevant, outdated or inadequate. None of these applied to the BBC article.

Moreover, lawyers told the Register, respecting the “right to be forgotten” isn’t Google’s only legal requirement; it must balance that against freedom of information. That Google agreed to remove links that were in the public interest, and is now reinstating them, shows it misinterpreted the law, they say. Quartz has requested comment from Google; it previously said that “This is a new and evolving process for us.”

At the heart of the debate is how much Google should have to shoulder the burden of enforcing European laws. For now, it is up to Google to decide whether a particular link is indeed worth removing. Those who worry about creeping censorship believe it should not be the arbiter. Such cases are far less clear-cut than copyright infringement—another case in which Google may be asked to take down links—because complainants can either prove they own the copyright, or they cannot. Google can decline individual requests to remove results and let applicants go to their local data protection commissioner; but it cannot simply relegate them all.",
photo: "",
taglist: "google business tech"},

{title: "The NSA may have another leaker on its hands",
body:"Edward Snowden has done a lot of damage to the National Security Agency by disclosing dozens of its most sensitive internet surveillance programs—but there may be a lot more to come from someone following in his footsteps.

German public broadcaster Das Erste revealed yesterday the existence of a previously undisclosed NSA program called XKeyscore, which automatically logs the online identities of anyone who even searches the web for tools that might keep their activities anonymous. Experts who are familiar with Snowden’s leaked documents say that this information is from a new source.

“I do not believe that this came from the Snowden documents,” wrote security expert Bruce Schneier, who had access them through his work with the Guardian. “I also don’t believe the TAO catalog came from the Snowden documents,” he said, referring to the “tailored access operations” that the NSA uses to gain access to certain priority targets. “I think there’s a second leaker out there.”

XKeyscore logs the IP address of anyone searching for “privacy-enhancing software tools” like the TOR Project, free software that can ensure online anonymity that is used by millions of people a day.",
photo: "http://img.qz.com/2014/07/snowden.jpg?w=1160",
taglist: "politics"},

{title: "Those with the highest IQs grow up in the country and move to the city",
body:"There are obvious economic reasons why people move some places and not others: Maybe they want a higher-paying job, or maybe a lower rent or mortgage. There might be personality factors involved, too, hence American stereotypes about friendly Midwesterners or irritable Northeasterners. But what role, if any, does basic intelligence play in determining where people choose to live?

That’s the question at the heart of a new analysis from psychologist Markus Jokela of the University of Helsinki. In an upcoming issue of the journal Intelligence, Jokela reports that cognitive ability does explain some of America’s migration decisions, even after accounting for factors like income. But the findings are hard to boil down into any simple takeaway other than this: Smart people just don’t like to stay put.

On one hand, according to Jokela’s analysis, central cities draw the smartest people from rural, suburban, and outer-urban areas, especially among younger populations. (“In terms of managing cities, I think all the points about how cities try to attract ‘talent’—measured in terms of skills, education, etc.—apply,” he tells CityLab.) On the other hand, city centers also lose many of their brightest to these areas at some point in time.

“The most general message is that the selective residential mobility we observe associated with socioeconomic status has its psychological underpinnings in intelligence differences,” says Jokela.",
photo: "http://img.qz.com/2014/07/ap34009383675.jpg?w=1160",
taglist: "science"},

{title: "Gold, cars, and smartphones—India’s changing consumption pattern in six charts",
body:"The latest official consumption data on India, released by the National Sample Survey Organization (NSSO) last month, shows a society that is growing in aspiration, exhibiting greater levels of consumerism and embracing modern shifts in technology. Perhaps most notably, rural India is now matching urban India in that transition. Based on 2011-12, the most recent NSSO data available, here are the most striking manifestations of changing consumer behaviour:

Between 2009-10 and 2011-12, the small percentage of Indians who buy gold have been devouring the yellow metal. Just 4.9% of urban families and 3.4% of rural families bought gold ornaments in 2011-12. Rural families spent an average of Rs 25,081 on gold ornaments—only 10% less than the Rs 27,855 spent by urban families. And as a share of its total spend on physical assets, the rural families easily outpaced urban ones.",
photo: "http://img.qz.com/2014/07/india-consumer.jpg?w=1160",
taglist: "india business"},

{title: "China-South Korea relations may be better than ever, but they’ll never be that great",
body:"Chinese president Xi Jinping has been courting South Korea’s Park Geun-hye this week, and in the process snubbing China’s longtime ally, North Korea. Meanwhile, Japan has announced plans to drop some sanctions against North Korea, imposed when the regime abducted Japanese citizens in the 1970s and 1980s. It also recently decided to amend its pacifist constitution to allow for a more active military, in the face of increasingly aggressive Chinese maritime claims.

These developments are all signs of the shifting alliances in East Asia, which as well as contributing as much as 40% of global GDP is also one of the world’s most contentious security flashpoints.

The biggest political change in the region is China’s relationship with South Korea. Observers have taken Xi’s recent overtures towards Seoul to mean that he is growing increasingly impatient with Pyongyang, and wants to form alliances against Japan and possibly the US as well.

To do this, Xi comes bearing promises of increasing trade between the two countries—already worth around $230 billion annually. On July 3, Xi and Park agreed to finalize a free trade deal before the end of the year and to set up direct yuan-won trading. On July 4, founders of three of China’s top tech giants—Baidu, Alibaba, and Huawei—as well as over 200 other executives attend a China-South Korea business forum to discuss finance, manufacturing, services and other sectors.",
photo: "http://img.qz.com/2014/07/xi-jinping-and-park-web.jpg?w=1160",
taglist: "politics china"},

{title: "Mario Draghi’s idea of richer ECB communication is to hold fewer press conferences",
body:"Nobody moves markets like Mario Draghi. Traders hang on every word from the president of the European Central Bank, in part because the ECB is one of the more opaque central banks when it comes to explaining its rate-setting decisions.

Under its current rules, the minutes from the bank’s monthly meetings are released with a 30-year delay. Most other central banks publish minutes a few weeks after announcing changes to rates, giving investors a feel for the policymaking process. By contrast, the market’s understanding of the mood of ECB council members depends on how talkative Draghi happens to be with the Frankfurt press corps.

These rules changed today, with the ECB pledging to publish “accounts” of monetary policy meetings starting next year. This has been mooted before, but delayed by fears of stoking cross-border tensions: If the votes of individual board members are revealed, it could bring extra pressure on them to be seen standing up for national interests, the thinking goes. Draghi said today that the ECB will conduct “dry runs” with the new communication policy before deciding on the final format.

But what one hand giveth, the other taketh away. Draghi also announced today that the ECB will hold fewer meetings starting next year, moving from a monthly schedule to one that meets every six weeks. Monthly meetings make the markets expect constant action, Draghi said, and monetary policy is better conducted with long-term goals in mind. The new schedule will bring the ECB in line with the Federal Reserve in terms of meeting frequency, and puts it in the middle of the pack as far as big central banks go.",
photo: "http://img.qz.com/2014/07/ap111103025982.jpg?w=1160",
taglist: "business europe"},

{title: "SpaceX shows Washington its non-Russian “trampoline” into orbit",
body:"The US needs Russia’s Soyuz spacecraft to send astronauts to the International Space Station. So when Americans threatened to stop importing Russian rocket engines due to the country’s Ukrainian incursion, Russia’s defense czar, Dmitry Rogozin, taunted them with the suggestion that NASA might as well invest in trampolines to get into orbit.

Last night, that trampoline was unveiled to American politicians in Washington, DC. SpaceX’s new Dragon II spacecraft and its lead designer, CEO Elon Musk, sought to impress the members of Congress who will decide whether the vessel (and the company) will shoot for the stars or burn up in the atmosphere. Standing about 20 feet (6.1 meters) tall in a humid outdoor tent—the organizers couldn’t find a venue with a door big enough—the Dragon II loomed over the crowd of politicos below.

Reporters swarmed around Musk to ask him about a different fight he is having in Washington: a lawsuit demanding open competition for military satellite launch contracts against the incumbent, United Launch Alliance (ULA), a Boeing/Lockheed Martin joint venture. It was this lawsuit that spurred the battle over Russian rocket engines, which ULA’s rockets use.

That battle will play out in the courts (and in public opinion), but the event showed that even though SpaceX is, in Musk’s own words, an “up-and-comer,” it boasts substantial political leverage of its own. And a great draw—who doesn’t want to climb into a spacecraft, especially one that is arguably the most advanced ever built? Throughout the night, members of Congress scrambled in and out of the hatch to experience a cockpit that has more in common with Apple’s products than Boeing’s.",
photo: "http://img.qz.com/2014/06/musk-dragonii-la-061114.jpg?w=1160",
taglist: "space tech"},

{title: "Elon Musk says he lost a multi-billion-dollar contract when SpaceX didn’t hire a public official",
body:"Elon Musk isn’t afraid to shake things up, and he did so again with accusations that US defense contracts awarded to a competitor were the product of corruption.

SpaceX, Musk’s orbital transport firm, has been competing for a major contract to put US Air Force satellites in orbit. With a dearth of private investment in space and the end of the US space shuttle program, SpaceX has quickly leapt to the fore of aerospace firms with the help of contracts from NASA to provide re-supply missions to the International Space Station and develop a manned spacecraft to fly astronauts there.

He’d like to expand his franchise to the defense department, but his company has faced a more challenging time displacing the incumbents there: In a no-bid process, United Launch Alliance (ULA), a joint venture of Lockheed Martin and Boeing, received a bulk contract worth billions of dollars for 36 rocket launches earlier this year, despite plans to introduce more competition and other cost-saving measures.",
photo: "http://img.qz.com/2014/05/ula-052314.jpg?w=1160",
taglist: "space tech"},

{title: "Finding a new Earth could be a sign we’re on our way to extinction",
body:"Last week, scientists announced the discovery of Kepler-186f, a planet 492 light years away in the Cygnus constellation. Kepler-186f is special because it marks the first planet almost exactly the same size as Earth orbiting in the “habitable zone”—the distance from a star in which we might expect liquid water, and perhaps life.

What did not make the news, however, is that this discovery also slightly increases how much credence we give to the possibility of near-term human extinction. This because of a concept known as the Great Filter.

The Great Filter is an argument that attempts to resolve the Fermi Paradox: why have we not found aliens, despite the existence of hundreds of billions of solar systems in our galactic neighborhood in which life might evolve? As the namesake physicist Enrico Fermi noted, it seems rather extraordinary that not a single extraterrestrial signal or engineering project has been detected (UFO conspiracy theorists notwithstanding).

This apparent absence of thriving extraterrestrial civilizations suggests that at least one of the steps from humble planet to interstellar civilization is exceedingly unlikely. The absence could be caused because either intelligent life is extremely rare or intelligent life has a tendency to go extinct. This bottleneck for the emergence of alien civilisations from any one of the many billions of planets is referred to as the Great Filter.",
photo: "http://img.qz.com/2014/04/ap654244236570.jpg?w=1160",
taglist: "space tech"},

{title: "Space isn’t just the final frontier—it’s a dangerous venue for geopolitical brinksmanship",
body:"Whether it’s Russia’s military adventures in the Crimea or China’s less-than-neighborly attempt to exert influence in the South China Sea, international tensions are on the rise—and if those tensions lead to accidents in space, neither the community of nations nor the US has the tools to prevent such a conflict from spinning out of control and costing billions.

American national security analyst Micah Zenko of the Council on Foreign Relations outlines these concerns in a new report on the growing threat of dangerous space incidents. He compares the problem to cybersecurity, another relatively new concern that has attracted attention from the world’s security leaders. In comparison, he says that senior officials are not paying enough attention to potential problems in space, where there is much less room for error.

“The difference is that cyber domain can be degraded [by cyber attacks,] but space just falls off a cliff,” Zenko says of a scenario where satellites are damaged intentionally or by accident. “Once the debris is there [in orbit] it’s there forever unless you bring it back down or burn it up, and we are many years from anything like that.”

Zenko is concerned about scenarios where countries like China, North Korea or Iran seek to demonstrate their space capabilities in a crisis by testing or actually deploying anti-satellite weapons. The US, the country most dependent on space technology both commercially and militarily, is particularly vulnerable to an attack like that; private companies spent $225 billion on commercial space activity in 2012, according to the Space Foundation (pdf). Replacing damaged satellite infrastructure isn’t exactly a walk in the park.

And this isn’t just fear-mongering: A Chinese anti-satellite test in 2007 went wrong, creating a cloud of debris that inspired the movie Gravity‘s space-station-shredding catastrophes. China is currently testing technology that involves moving satellites close together in orbit, and no one is sure if they’ll be able to keep such tests under control or what they’ll do if it goes wrong again.",
photo: "http://img.qz.com/2014/04/nk-space-042114.jpg?w=1160",
taglist: "politics space tech"},

{title: "Things get weird when objects get hooked up to the internet",
body:"With the flood of new connected services and devices on the market, knowing how future users might hook them together or find unexpected new uses is a challenge, no matter what Silicon Valley’s confident young bucks may tell us. A service called IFTTT is giving us an interesting peek into the practical, clever and slightly weird ways people want to use the Internet of Things (IoT).

As a user-friendly dashboard that allows non-experts to fit feeds from favorite media, utilities (like cloud storage, social networks, home devices) and wearables in new combinations, or “recipes,” IFTTT is putting a broad array of tech in people’s hands for experimentation. Think of it as a friendly front end to the myriad of data connections and mashup of programming it would normally require to get our favorite apps and devices to talk together. Users can do things are practical, like backup certain tagged photos to the cloud, find out when an apartment is available or highly personal, such as satisfying secret Kardashian fetishes.",
photo: "http://img.qz.com/2014/07/ap602757989505.jpg?w=1160",
taglist: "tech"},

{title: "Google’s Street View cameras are touring museums and taking weird selfies by accident",
body:"Google’s Art Project was launched three years ago as a sort of Street View for museums and art galleries. Using panoramic cameras mounted on trolleys, Google captures the artwork and gilded halls of 250 institutions around the world—all the while trying to stay out of sight.

The curtain slips a bit in the Camera in the Mirror, a new Tumblr project by the Spanish artist Mario Santamaría that collects accidental self-portraits of Google’s hulking cameras while they go about their work. It turns out that museums have a lot of mirrors, and the cameras often photograph themselves in front of them.

Sometimes swaddled in silvery capes or attended to by ghostly minders, the android-like devices call to mind the Victorian mothers who would hide underneath blankets to keep their toddlers from squirming during portraits. Collected together, the Google-camera selfies are at turns unsettling, revealing, and absurd—unintentionally upstaging the art they’re meant to quietly document.",
photo: "",
taglist: "tech google"},

{title: "Facebook may finally have found a way to make money from poor people",
body:"After the United States, the market with the most Facebook users is India. Yet India contributed less than a quarter of 1 percent of Facebook’s global revenue in the year to March 31, 2013. This week, Facebook’s operations boss Sheryl Sandberg is in India talking to companies, the press, and government officials in an effort to drum up some business.

And back in Silicon Valley, Facebook’s engineers are unveiling an ad innovation that they hope will help her make the case: the “missed call.”
  
No one in India—or much of the developing world—needs an explanation of the utility of a missed call, but for those in the West, here’s how I described it in a piece published in June:

Missed call communication is when you call someone but hang up as soon as it rings. The idea is to send a simple, often pre-agreed, message without having to pay for the call: “I am waiting outside” or “Deliver some milk” or “I vote for this candidate on Indian Idol.”

Facebook’s big idea is to include a “missed call” button in ads on mobile phones in India.

When a person sees an ad on Facebook they can place a “missed call” by clicking the ad from their mobile device. In the return call, the person receives valuable content, such as music, cricket scores or celebrity messages, alongside a brand message from the advertiser — all without using airtime or data.

This is not a novel approach. The Indian arm of Unilever, a consumer-goods giant, has been running a similar promotion that allows people to make a missed call to trigger a return call that plays a radio station with Unilever ads. Indian talent shows have also long used missed calls to allow people to vote for contestants, instead of requiring them to dial a premium number.",
photo: "http://img.qz.com/2014/07/india-advertising.jpg?w=1160",
taglist: "india tech business facebook"},

{title: "Alibaba boss Jack Ma says he has never used Taobao or Alipay, and doesn’t plan to",
body:"Tech companies often urge employees to “drink their own Kool-Aid” by becoming heavy users of their own products, but Alibaba co-founder and chairman Jack Ma apparently refuses to drink a drop.

In a speech last night to the graduating class of Tsinghua University’s School of Economics and Management in Beijing, Ma said that has never purchased a product on Taobao, Alibaba’s dominant e-commerce site. Moreover, he doesn’t know how to use Alipay, the company’s pervasive electronic payments service that is now even bigger than PayPal.

Ma thinks “if he used his own products too much, he would naturally be biased, and therefore lose the feeling of anxiety to improve them,” the state-run Xinhua news agency reported.

Ma’s frank admission, if taken at face value, may cause some consternation among investors considering whether to buy Alibaba’s shares in the company’s forthcoming IPO. After all, if the chairman isn’t familiar with his own company’s products, how good of a leader can he be?

But on the other hand, perhaps Ma is on to something. A former executive at Amazon, which is often compared to Alibaba for its size and breadth, said last week that CEO Jeff Bezos’ obsession with fine-tuning the company’s hardware products like the Fire smartphone often became a major distraction.",
photo: "http://img.qz.com/2014/07/jack-ma.jpg?w=1160",
taglist: "china tech"},

{title: "The clear message of the markets in 2014: Coffee is king",
body:"The first half of the year is pretty much over and one thing is clear: Coffee is king.

Thanks to drought in Brazil, the world’s largest producer, coffee futures have soared, making your morning jolt one of the best things you could have speculated on so far in 2014.

Hog prices are also high on this list, as disease has ravaged US pork producers. Argentina and Ukraine also look like they’ve done well on paper, but buyer beware: Those indexes were boosted higher by sharp currency devaluations. Nickel prices rose on Russia/Ukraine unrest. (Russia is the second-largest producer of this key ingredient for stainless steel.) Prices for US feeder cattle—the young animals that are sold to feed lots to be fattened for slaughter—also jumped, due to drought in the southern Great Plains, which cut herd sizes.

Excitement over the Indian elections pushed stocks higher in the world’s largest democracy. Meanwhile, signs of a return to stability under the muscular leadership of former military chief Fatah al-Sisi seemed to give Egyptian stocks a lift, after years of unrest. Labor strikes in South Africa, a key palladium producer, drove prices of the precious metal up.",
photo: "http://img.qz.com/2014/06/coffee-prices-brazil-drought-futures-markets.jpg?w=1160",
taglist: "business india"},

{title: "Like the Dow in the 1980s, India’s Sensex is poised to climb four-fold to 100,000",
body:"The past year turned out to be quite constructive for Indian equity. Markets made fresh lifetime highs on the back of improving domestic macros indicators, supportive global equity and expected governance improvement in India after the general elections. The benchmark index, the Sensex, crossed 21,200, a level it had not seen in almost six years. Foreign institutional investors reaffirmed their commitment toward Indian equities with more than $20 billion invested in 2013.

This is our new reality: 2014 will bring a new bull cycle into existence. A strong export sector, revival in investment activity, continued recovery in the US, and a stable euro area are significant positives for equity markets.

Despite the many negatives plaguing the economy, corrective measures by the new government can quickly revive growth. The potential growth rate of the economy is currently around 6%. The growth rebound to those levels can take place quickly by reviving the investment demand. Once that has been achieved, the more arduous path of reclaiming the 8% growth can start.

Macro-economic revival in India will open opportunities to make strong returns in the equity markets in the next few years. The agricultural and services sectors continue to show strong traction and gradually even the manufacturing sector should pick-up as consumer demand revives. A real GDP growth of 6% along with inflation of around 7% should lead to a nominal GDP growth of 13%. Sensex earnings growth has improved from 5% in fiscal year 2013 to about 10% in fiscal year 2014 on the back of the rupee’s depreciation.",
photo: "http://img.qz.com/2014/06/ap983854554382.jpg?w=1160",
taglist: "india business"},

{title: "This major US news organization is also a Wall Street trader",
body:"Most think of it as news and data organization. But recent trading disclosures from the Financial Industry Regulatory Authority show that Bloomberg LP  is a trader too.

Bloomberg’s so-called alternative trading system (or ATS, in the industry’s acronymic parlance) helps investors trade securities outside of mainstream exchanges like the New York Stock Exchange and Nasdaq OMX. Bloomberg ranked 33rd in trading volume with 8.4 million shares sold for the week between May 12 and May 18, according to data recently made public by FINRA. (It was the first time Finra has released data on ATS systems, which include so-called dark pools.)

It’s important to note that trading data disclosed by Finra—in an effort to offer greater transparency—represents just a week of trading in the shares of about 1,500 companies. Still, it’s impressive that a data shop like Bloomberg—founded more than three decades ago by Michael Bloomberg, now the ex-mayor of New York—has found a trading niche for itself.

It also raises interesting questions about the evolution of Bloomberg LP, which is morphing from simply an organization that sells market data and news to Wall Street traders, into one that may one day be competing with those very same clients for market share in the trading business. Bloomberg’s transformation comes as sales of its expensive terminals have slowed from double-digit growth rates of 35% from 2005 to 2007, to the low single-digits in recent years.",
photo: "http://img.qz.com/2014/06/bloomberg-is-a-great-place-to-trade.jpg?w=1160",
taglist: "business tech"},

{title: "Bitcoin is no longer the worst investment in the world",
body:"Great news for the bitcoin faithful. The crypto-currency, which crashed after reaching highs of over $1,100 late last year,  is no longer the absolute worst thing you could have bought this year. Now it’s merely the third worst.",
photo: "http://img.qz.com/2014/06/australia-iron-ore-prices.jpg?w=1160",
taglist: "bitcoin tech"},

{title: "Russian markets had an absolutely huge May",
body:"Russian markets bounced back sharply in May, even amid ongoing clashes in neighboring Ukraine. Of course, Russia’s unilateral seizure of Crimea and continuing violence by pro-Russian separatists had first driven markets sharply lower earlier this year. May’s recovery in Russia’s Micex stock market index still leaves it down 2.6% so far in 2014.

Other big movers in global markets in May included futures contracts for “feeder cattle.” Prices for still-to-be-fattened calves have surged amid a sharp jump in beef prices—and declining corn prices, making these cows cheaper to bulk up.

Indian stock markets also surged on investor optimism tied to the election of Narendra Modi. And expectations that Chinese policymakers will move to prop up economic growth have helped China-centric indexes—such as Hong Kong’s Hang Seng—log strong gains in May.",
photo: "http://img.qz.com/2014/06/putin-trophy-stock-martket-winner.jpg?w=1160",
taglist: "business russia"},

{title: "Wall Street’s trading business looks depressingly bad",
body:"Look out below! On Wall Street, revenue from fixed-income trading is dropping fast. And the outlook for the second quarter isn’t good. If it seems like a replay of the first-quarter results, that’s because it is–only worse.

Credit Suisse delivers the latest grim predictions, in a report released today, noting the trading divisions at major financial institutions are in a serious tailspin. In the research piece, Credit Suisse forecasts that revenue in the fixed income, currencies and commodities groups (FICC) —where the bulk of Wall Street trading is done—may be down by as much as 20% year-over-year, when the second quarter ends next month. This is a particularly grim prediction given that the biggest banks in the industry already reported first-quarter results in trading that were pretty bad. Here’s a look at the first-quarter results.",
photo: "http://img.qz.com/2014/05/rtx16ybz.jpg?w=1160",
taglist: "business"},

{title: "A uranium price collapse has made mining companies radioactive to investors",
body:"Here’s the latest sign that uranium-mining doesn’t pay: Paladin Energy, an Australian uranium mining group, announced today that it was ceasing production (pdf) at a key mine in Malawi. The move will take 3.3 million pounds of uranium per year off the market.

Paladin blames the plunge in the market price for the commodity, which has been languishing below $30 per pound, down from a peak of around $140 per pound in 2007.

The firm said it will restart its idled mine, a process that takes nine months, only when uranium prices rise to $70-75 per pound, or nearly triple the going rate.

Paladin is far from alone. As uranium prices have tumbled, others have been feeling the pinch. Indeed, for some 60% of global uranium production, the cost of extraction is higher than the market price for the commodity, the firm says.",
photo: "http://img.qz.com/2014/05/rtx188gk.jpg?w=1160",
taglist: "business"},

{title: "China’s replica of Wall Street is full of half-built, deserted skyscrapers and floods regularly",
body:"The skyline of Yujiapu in the Chinese city of Tianjin looks more like an expensive, abandoned movie set than it does “China’s new Manhattan,” as the financial district was once billed. A patina of dust covers the glass doors of the 47 office buildings and hotels that still sit empty, and in come cases unfinished.

This Manhattan-style ghost city on some of the best real estate in Tianjin, a port city just south of Beijing, is a victim of China’s investment boom—and, as is increasingly apparent, its bust. Tianjin has led the debt bonanza of the last five years, loaning out money faster than anywhere else in China since the financial crisis hit in 2009.

Much of the construction ceased back in 2010, and the deserted avenues left behind reflect the reckless borrowing of local-government financing vehicles (LGFVs)—companies created by city and provincial governments to borrow cheaply from state-owned banks to fund prestige-boosting infrastructure projects. Built by one of Tianjin’s most powerful local-government financing vehicles (LGFVs), Yujiapu promised to become “the world’s largest financial district,” with at least 200 billion yuan ($32 billion) invested to create a new center of Chinese “financial innovation.”",
photo: "http://img.qz.com/2014/06/manhattan-tianjin-local-government-financing-vehicles-property-bubble-china-real-estate-financial-bankruptcy-investment.jpg?w=1160",
taglist: "china"}
]

conz_articles_hash = [{title: "New Findings Reveal What Women Really Think About Short Men",
body:"Since the dawn of time, short men have been ridiculed as 'unmanly,' 'womanly,' 'pussies,' etc. In a survey conducted by Men's Health Magazine, the 1,000 men polled stated that they 'don't respect' shorter men and even find them 'laughable.'

What do the women think though? 'Not shorter than me' is a common requirement amongst women when asked what they look for in a man, but that may be because it is an easy go-to trait. 'Of course he should be taller than I am.'
  
But if shortness is sexually-selected, then how come short men still exist? Wouldn't only the tallest men win in the natural selection of women's preferences? Shouldn't short men be bred out of humanity by now if this was the case?

It turns out that while women may say one thing about what they look for in a man, what they're actually attracted to is much less tangible. In a University of Vancouver study, while 90% of women say they aren't attracted to short guys, with many being incredibly specific about their height preferences (ex. 'at least 5 inches taller than me,' 'no one shorter than 6 feet') in spite of their own short stature, 80% of those same women have dated people who don't fall under their specifications. When asked why they would date someone with traits that they specifically express disinterest for, these women reported that these 'taboo' men just completely won them over, that before they realized it, they had fallen for them.

So short men, do not fret. And ladies, don't be so quick to judge. A short guy could have a really cute smile, or have really nice, sexy arms, or be so shy about other people looking in the mirror with him that it's adorable. Maybe he's just super sweet because he's willing to go out of his way to run out and buy you bread when you're cramping like a mofo.

Either way, there can be so many great things about a short guy that you forget about his small frame and just see him for the super sweet, super smart, super great guy that he is.",
photo: "https://s3.amazonaws.com/TopazProd/articles/photos/000/000/007/big/orphan_black.jpg?1404611006"},

{title: "Studies Show That Words Look Strange When You Look At Them For Too Long",
body: "After coding for 4 hours straight, Carolyn Jiang** thought she was seeing things. The word “follow,” which was once a trivial word in her vernacular, suddenly looked odd. Was F-O-L-L-O-W really the right way to spell “follow”? Even enunciating the syllables out loud sounded like she was speaking in foreign tongues.

This phenomenon is a common problem plaguing youths today as they spend hours on the computer reading articles, Facebook statuses, and tweets. Researchers at the University of Phoenix conducted a study with 100 students across all schools to look into this mind-boggling illusion. They locked each student in a room for 24 hours with nothing but a book and a computer. Naturally, as students of this day and age are wont to do, each student spent the first 6 hours mindlessly surfing the Internet without breaks. Eventually, he or she turned to the book in order to rest his or her eyes, but researchers soon found that the subjects began acting as if they were going crazy. Eyes bulging as they read the pages of the Charles Dickens novel, some even started talking to themselves, repeating certain words over and over in different intonations with nothing sounding right.
  
The researchers concluded that kids need to go outside.

**name changed to hide identity",

photo: "https://s3.amazonaws.com/TopazProd/Semantic-e1382262909875.jpg",
taglist: "humor"},

{title: "13 Problems Only App Academy Students Understand",
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

photo: "https://s3.amazonaws.com/TopazProd/photo.JPG",
taglist: "humor tech"},

{title: "Spotify hasn’t gone public yet, but it is hosting practice earnings calls",
body:"How ready is streaming-music service Spotify for an initial public offering? Well, it’s already conducting practice earnings calls.

The privately-held company held one such call to discuss quarterly results as recently as the first week of May with some investors as well as members of the group of bankers—a group that includes Morgan Stanley, Goldman Sachs, and Deutsche Bank —that extended a recent $200 million line of credit, sources tell Quartz.

The so-called “earnings call” was characterized as a “dry run,” or prelude to the sort of post-earnings conference calls public companies regularly use to address additional questions from analysts, the sources said.",
photo: "http://img.qz.com/2014/06/spotify-and-its-ceo-daniel-ek-are-gearing-up-to-go-public.jpg?w=1160",
taglist: "business tech mobile"},

{title: "Uh-oh, Yo has major security flaws",
body:"Yo, the mobile messaging app that quickly rose to popularity this week with a bewilderingly simple premise—the only message it can send is “yo”—has a lot more than that lurking beneath its surface.

At least until several hours ago, Yo exposed all of its users’ phone numbers to anyone with the wherewithal to request them. Several developers demonstrated the issue, which takes advantage of flaws in the way Yo talks to its database.

And that’s not all. Another developer was able to inject a message into the app that appeared to many users.",
photo: "http://img.qz.com/2014/06/iphone-user.jpg?w=1160",
taglist: "mobile tech"},

{title: "And now a word from the people invading your privacy",
body:"Last week, as we reported, Apple made a tiny technical change that could make it more difficult for marketers to spy on you. The company changed a setting that broadcasts an iPhone’s Media Access Control (MAC) address to any Wi-Fi network within range. Businesses use this to identify a phone and figure out how many times its owner has been in a shop and for how long, or where in the shop she is browsing. The change is that in iOS 8, the iPhone’s new operating system due out later this year, your Apple device will broadcast a random “fake” MAC address, which will make tracking somewhat more difficult, unless you actually connect it to a Wi-Fi network.

But Apple’s moves may not be all about consumer protection. The company is meanwhile also pushing retailers to adopt its iBeacon technology, which helps them provide location services and ads to smartphone users via Bluetooth. Making Wi-Fi tracking harder means companies that relied on it are more likely to concentrate their efforts on Bluetooth instead. This would suit Apple nicely, but it worries companies that make their money tracking your movements for retailers. (We have requested comment from Apple, and will update this post if we hear back.)

“Apple is a bit disingenuous when they say they say they are protecting users from being tracked,” says Geary Eppley, head of engineering at Point Inside, a firm that tracks people (see update below) to provide indoor maps and retail analytics to big-box retailers such as Lowes, a hardware store in the United States. “It would be more honest to say that they are protecting users from being tracked by anyone but Apple.”",
photo: "http://img.qz.com/2014/06/apple-iphone-store-cash.jpg?w=1160",
taglist: "apple mobile tech business"},

{title: "Amazon’s phone pricing actually is not disruptive at all",
body:"Amazon had an opportunity to shake up the wireless industry with radical pricing for its new Fire Phone. But it’s actually quite conventional.

The Amazon phone, unveiled today, will cost about the same as most other good smartphones: $199 or $299 with a two-year contract and $649 or $749 unlocked, depending on storage capacity. And its exclusive US carrier partner AT&T isn’t offering anything special, either. (No word yet on international carriers.)

The one carrot Amazon is dangling to potential customers: For a limited time, it will give Fire Phone buyers a free year of its Prime service—a $99 value, which includes free two-day shipping on Amazon orders, video and music streaming, and some free Kindle books. Existing Prime customers can extend existing subscriptions by a year. That’s a nice bonus, and might be enough to convince Amazon devotees to switch phones. But it’s hardly revolutionary.",
photo: "http://img.qz.com/2014/06/amazon-ceo-jeff-bezos-fire-phone-event.jpg?w=1160",
taglist: "mobile tech business amazon"},

{title: "Amazon launches a shopping machine and calls it a phone",
body:"Amazon’s Fire Phone is here: CEO Jeff Bezos unveiled the company’s first smartphone at an event today in Seattle. Details are still rolling in, but Bezos has already made one thing clear: This is a shopping device.

The most interesting feature so far is called Firefly: An image recognition app that can supposedly detect and identify more than 100 million items, ranging from physical products on sale at Amazon—Bezos demonstrated the feature with a Nutella jar, among other products—to songs and phone numbers. The phone has a dedicated Firefly button on its side, meaning that the feature—and your credit card—is always only a tap away.

Amazon is also opening the service to developers so they can build Firefly into their apps. Two examples, via the Verge’s Fire Phone liveblog: Using MyFitnessPal to get nutritional information for food or Vivino to get more information about wine. This could be one way to get companies creating custom apps for the Fire Phone’s app store instead of just porting over their plain Android apps.",
photo: "http://img.qz.com/2014/06/jeff-bezos-amazon-fire-phone-ap.jpg?w=1160",
taglist: "mobile tech business amazon"},

{title: "Twitter brought a drone to Cannes so ad execs could take aerial selfies",
body:"Advertising companies hoping to attract attention at this week’s Cannes Lions advertising festival on the French Riviera have chartered yachts and helicopters, among other excesses. Twitter, meanwhile, has a drone, rigged to take “dronie” (drone + selfie) videos for posting to Twitter’s new @Dronie account.",
photo: "",
taglist: "twitter tech mobile business"},

{title: "Twitter doesn’t know enough about its users—so it’s asking them",
body:"Twitter knows whom you follow. But Twitter does not know why you follow them. So the company doing something fairly straightforward—and, for a tech company with reams of data bout its users, unlikely: It’s asking. Politely.

NT Balanarayan, a reporter with Medianama, an Indian technology blog, writes this week about a survey Twitter asked him to fill out. Balanarayan was given a list of five people he follows and asked, “Why are you following these five individuals?” The options, which do not include “because everybody is following them,” are:

We’re related.
We’re friends.
We work together (or did in the past).
We go to the same school (or did in the past).
I find their Tweets informative.
I find their Tweets funny/amusing.
I’m a fan outside of Twitter

Twitter is also running a 90-minute focus group for Indian tweeters later this month, with a Rs 2,000 ($33.50) gift voucher at a local department store as incentive. It is unclear whether the survey is aimed only at Twitter users in India, or in other markets as well. (Twitter did not respond to a request for comment.)",
photo: "http://img.qz.com/2014/06/dick-costolo-twitter-ceo.jpg?w=1160",
taglist: "twitter tech mobile business"},

{title: "London’s cabbies just gave Uber its biggest boost yet—by striking against Uber",
body:"Some 12,000 black-cab drivers clogged the streets of central London yesterday, June 11, to protest the taxi-booking app Uber.

So what did Londoners do? Well, they downloaded Uber onto their smartphones.

The app jumped 47 points to land at #2 (registration required) on Apple’s UK iOS app store by the end of the strike, according to App Annie, a research and measurement firm. Uber’s UK manager told the Independent that signups for the app jumped 850% , compared with the same day of the week earlier.",
photo: "",
taglist: "mobile tech"},

{title: "Investors responded to Hong Kong’s huge pro-democracy protests with a great big “meh”",
body:"Markets typically dislike mass protests; they portend instability. But though nearly 100,000 Hong Kong residents (according to police; half a million according to the organizers) thronged the streets of the island territory to call for electoral reform yesterday, the stock market—which was closed on July 1 because it was a local holiday—reacted with aplomb today.

Why, if the economic data out of China look promising, would Hong Kong-focused companies outperform mainland firms? Probably, says the New York Times (paywall), because the business world was simply relieved that the July 1 demonstrations and overnight sit-ins were peaceful.",
photo: "http://img.qz.com/2014/07/hong-kong-protest-market-beijing-china-handover-democracy-hang-seng.jpg?w=1160",
taglist: "china business"},

{title: "Google killed the web address—so why is it trying to sell you one?",
body:"When Google released its web browser, Chrome, in 2008, the most striking thing about it was that it merged the web address bar—where you type in qz.com—with the search bar. It called this the “omnibox.” As new domain names rolled out this year, observers wondered what the point was when nobody remembers, let alone types, full web addresses any more. Google has also toyed with the idea of further obscuring the web address in Chrome.

But no matter how much browsers hide the web address, it isn’t going anywhere. Addresses remain fundamental to the architecture of the web. Without them websites would be identified only by a series of numbers. Regular internet users would have no idea where they are on the web, or whether to trust the site. Moreover, the web address is also an essential piece of marketing for any business that needs an internet presence (pretty much all of them).

Little wonder then that Google is getting into the domain-name-retailing game now dominated by the likes of GoDaddy. The web giant yesterday, June 23, launched a beta version of Google Domains, which will eventually allow people to register their domain names with Google. It promises reasonable prices ($12), integration with website builders, and lots of free extra features, including privacy protection and email. Up until now, registering a domain has not felt easy; Google could make it seem easy.",
photo: "",
taglist: "google tech"},

{title: "Forget drones: Microsoft’s plan to bring the internet to the world is all about TV",
body:"Google will spend between $1 billion and $3 billion to put 180 satellites in orbit, from where the company can beam the internet down to unconnected parts of the world, the Wall Street Journal reported this morning. That’s in addition to Google’s other high-tech internet missionaries: balloons floating high in the sky and drones circling overhead. Facebook also has lofty ambitions.

But there may be a simpler way to spread connectivity: Television white space. TV is broadcast using the electro-magnetic spectrum—as is radio, communications and cell phone signal. Each television channel owns one tiny slice of that spectrum, which is regulated by governments. But there are gaps between channels to prevent one from interfering with the next. As the world’s thirst for wireless technologies grows, government regulators are looking at unused broadcast spectrum as a way to ease congestion and spur innovation.

The idea may sound less glamorous than drones, satellites and balloons, but it’s an area where African countries are leading the way, with impressive results. And it has attracted a lot of attention ever since 2010, when the United States’ Federal Communications Commission announced that white space would be available license-free.",
photo: "http://img.qz.com/2014/06/internet-users-per-100-people-map-worldwide.png?w=1160",
taglist: "business tech"},

{title: "When net neutrality backfires: Chile just killed free access to Wikipedia and Facebook",
body:"Net neutrality is a sore subject in the United States. Proponents argue that allowing big companies to pay for faster data transfers to their customers would disadvantage start-up business that cannot afford such payments. They also say consumers could be forced to pay more for access to data-hungry services such as Netflix. Opponents of net neutrality say that those who use the most bandwidth should also be the ones paying the most for it. After all, the tubes that ferry data around the world are not public utilities—they are private business concerns.

A surprising decision in Chile shows what happens when policies of neutrality are applied without nuance. This week, Santiago put an end to the practice, widespread in developing countries, of big companies “zero-rating” access to their services. As Quartz has reported, companies such as Facebook, Google, Twitter and Wikipedia strike up deals with mobile operators around the world to offer a bare-bones version of their service without charging customers for the data.

It is not clear whether operators receive a fee from big companies, but it is clear why these deals are widespread. Internet giants like it because it encourages use of their services in places where consumers shy away from hefty data charges. Carriers like it because Facebook or Twitter serve as a gateway to the wider internet, introducing users to the wonders of the web and encouraging them to explore further afield—and to pay for data. And it’s not just commercial services that use the practice: Wikipedia has been an enthusiastic adopter of zero-rating as a way to spread its free, non-profit encyclopedia.",
photo: "http://img.qz.com/2014/05/chile.jpg?w=1160",
taglist: "politics business"}]

ari_articles_hash = [
  {title: "It's finally here, folks.",
  body: 
  "I'm sitting here trying to think of something meaningful to write on the penultimate eve of the demo of the final version of this website. I don't know, guys. Maybe they're right. Maybe I shouldn't. Maybe this is just some stupid crap we threw together for Employers' Eyes Only. Gotta look professional and all.
  
  But you know what? I can't drop this that easy. You don't just go and do something that turns you into a legit web developer overnight and also happens to completely change your life and then just give it an [Irish goodbye](http://www.slate.com/articles/life/a_fine_whine/2013/07/ghosting_the_irish_goodbye_the_french_leave_stop_saying_goodbye_at_parties.html) and ghost outta there. We laughed. We cried. We programmed. And we got drunk. Jesus, man, these people. No, we need to crack a bottle[;](https://www.youtube.com/watch?v=M94ii6MVilw) maybe some of that [Santana DVX](https://www.youtube.com/watch?v=xGcxhmiPtko).
  
  In other news, you know it was July 4th yesterday? And my folks just went and set off some fireworks. So I guess I feel kinda like doing that now. If I wasn't compelled to code some more. In fact, I think I'm gonna go code some more right now.
  
  But hey, what the hell, right? At least I've written something nice and personal. Speaking of which, can't place it but this article is still missing something. Humm. Oh yeah! Couple things, actually. I just finished up implementing some swank Markdown styling and I feel like showing off. [This girl](#users/2), man. She's *wild*. Maybe it's the lack of sleep, maybe it's the bleary eyes, maybe it's the [code](http://hackertyper.net/), but man, I think I'm in **love**.",
  created_at: "2014-07-06 00:00:00"}]
  
starting_time = Time.new(2014, 05, 31, 2, 2, 2, "+02:00")
users_id = User.pluck(:id)

articles_hash.each do |article_data|
  article_data[:created_at] = Time.at(starting_time.to_f + rand * (Time.now.to_f - starting_time.to_f))
  article_data[:author_id] = users_id.sample
  Article.create!(article_data)
end

Article.last.author_id = User.last.id

conz_articles_hash.each do |article_data|
  article_data[:created_at] = Time.at(starting_time.to_f + rand * (Time.now.to_f - starting_time.to_f))
  article_data[:author_id] = 2
  Article.create!(article_data)
end

ari_articles_hash.each do |article_data|
  if article_data[:title] != "It's finally here, folks."
    article_data[:created_at] = Time.at(starting_time.to_f + rand * (Time.now.to_f - starting_time.to_f))
  end
  
  article_data[:author_id] = 1
  Article.create!(article_data)
end

articles_id = Article.pluck(:id)

articles_id.each do |article_id|
  users_id = User.pluck(:id).shuffle
  num_votes = (0..100).to_a.sample
  
  num_votes.times do
    Vote.create!(user_id: users_id.pop, article_id: article_id)
  end
end