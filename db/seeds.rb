User.find_or_create_by!(username: "wacadmin") do |user|
  user.email_address = "admin@wonthaggiangling.com.au"
  user.password = "password"
  user.password_confirmation = "password"
end

puts "Admin user created: wacadmin / password"

# Membership Fees
puts "Seeding membership fees..."
[
  { name: "Adult", amount: 20.00, position: 1 },
  { name: "Family", amount: 40.00, position: 2 },
  { name: "Under 16", amount: 15.00, position: 3 },
  { name: "Social", amount: 10.00, description: "Ineligible to weigh in fish", position: 4 },
].each do |data|
  MembershipFee.find_or_create_by!(name: data[:name]) do |fee|
    fee.amount = data[:amount]
    fee.description = data[:description]
    fee.position = data[:position]
  end
end
puts "  #{MembershipFee.count} fee categories seeded."

# Committee Members (source: 2026-2027 Club Information Handbook)
puts "Seeding committee members..."
[
  { role: "President", name: "Stuart Lowe", phone: "0407 688 357", email: "basscoastlandscapes@gmail.com", position: 1 },
  { role: "Treasurer", name: "Stuart Lowe", phone: "0407 688 357", position: 2 },
  { role: "Secretary", name: "Ian Gilbee", phone: "0409 353 868", position: 3 },
  { role: "General Committee", name: "Stephen Howell", phone: "0438 755 503", position: 4 },
  { role: "General Committee", name: "Maxine Kelly", phone: "0418 566 623", position: 5 },
  { role: "General Committee", name: "Allan Bentick", phone: "0468 349 668", position: 6 },
].each do |data|
  CommitteeMember.find_or_create_by!(role: data[:role], name: data[:name]) do |member|
    member.phone = data[:phone]
    member.email = data[:email]
    member.position = data[:position]
  end
end
puts "  #{CommitteeMember.count} committee members seeded."

# Competitions (source: 2026-2027 Club Information Handbook)
puts "Seeding competitions..."
competitions = [
  {
    name: "Monthly Competition",
    position: 1,
    description: %Q(Held on the <strong>third Sunday of each month</strong>. Fish can be entered from any open Victorian waters. Weigh-in is between 5pm and 6pm, followed by a free dinner and Happy Hour pricing ($4 beers, $6 spirits, $2 soft drinks). Raffles at every weigh-in with meat trays and vouchers up for grabs. Bonus points for the month's selected <strong>Fish of the Month</strong>.),
  },
  {
    name: "365 Day Comp",
    position: 2,
    description: %Q(Every day can be a comp day — for juniors and seniors. Enter as many times as you like at $2 per entry; entries are kept secret. A <strong>$25 prize</strong> goes to the heaviest fish of the year in each category: Whiting, Bream, Flathead, Perch, Salmon, Garfish, Snapper, Mullet, Gummy Shark, and Trevally. To enter, contact a committee member to weigh your fish (can be weighed whole).),
  },
  {
    name: "Local Bream Classic",
    position: 3,
    description: %Q(<strong>Sunday 12th April 2026</strong>. Rivers fished: Bass River, Powlett River, Screw Creek, and Tarwin River. Prizes for each section (Junior Female, Junior Male, Senior Female, Senior Male, Veterans 60+): <strong>$200 first prize</strong>, <strong>$100 voucher</strong> for Inverloch Fishing and Outdoors for runner-up. Barbecue at weigh-in. Visitors most welcome.),
  },
  {
    name: "Tambo River Comp",
    position: 4,
    description: %Q(<strong>Saturday 24th October 2026</strong>. Only the Tambo River can be fished, bank fishing only. Weigh-in <strong>5pm–6pm at Lealow Caravan Park</strong>. Barbecue at weigh-in. Visitors most welcome.),
  },
]
competitions.each do |data|
  Competition.find_or_create_by!(name: data[:name]) do |c|
    c.description = data[:description]
    c.position = data[:position]
  end
end
puts "  #{Competition.count} competitions seeded."

# Fish of the Month (source: 2026-2027 Club Information Handbook)
puts "Seeding fish of the month calendar..."
[
  { fishing_date: Date.new(2026, 4, 19),  target_species: "Perch" },
  { fishing_date: Date.new(2026, 5, 17),  target_species: "Perch" },
  { fishing_date: Date.new(2026, 6, 21),  target_species: "Salmon" },
  { fishing_date: Date.new(2026, 7, 19),  target_species: "Salmon" },
  { fishing_date: Date.new(2026, 8, 16),  target_species: "Bream" },
  { fishing_date: Date.new(2026, 9, 20),  target_species: "Bream" },
  { fishing_date: Date.new(2026, 10, 18), target_species: "Snapper" },
  { fishing_date: Date.new(2026, 11, 15), target_species: "Snapper" },
  { fishing_date: Date.new(2026, 12, 20), target_species: "Flathead" },
  { fishing_date: Date.new(2027, 1, 17),  target_species: "Garfish" },
  { fishing_date: Date.new(2027, 2, 21),  target_species: "Whiting" },
  { fishing_date: Date.new(2027, 3, 21),  target_species: "Whiting" },
  { fishing_date: Date.new(2026, 4, 12),  target_species: "Local Bream Classic", special_event: true },
  { fishing_date: Date.new(2026, 10, 24), target_species: "Tambo River Comp",    special_event: true },
].each do |data|
  FishOfTheMonth.find_or_create_by!(fishing_date: data[:fishing_date]) do |entry|
    entry.target_species = data[:target_species]
    entry.special_event = data[:special_event] || false
  end
end
puts "  #{FishOfTheMonth.count} calendar entries seeded."

# About Sections
puts "Seeding about sections..."
about_sections = [
  {
    title: "About the Club",
    position: 1,
    body: <<~HTML
      <p>Wonthaggi Angling Club is a community of passionate anglers based in the heart of the Bass Coast region. Whether you're a weekend warrior chasing flathead or a seasoned pro targeting snapper, there's a place for you here.</p>
      <p>We run regular competitions, social events, and provide a welcoming clubroom for members to gather, share stories, and enjoy great company.</p>
    HTML
  },
  {
    title: "Clubrooms",
    position: 2,
    body: <<~HTML
      <h3>Location</h3>
      <p>McBride Avenue, Wonthaggi (near the main grandstand at the recreation reserve).</p>
      <h3>Facilities</h3>
      <p>Licensed premises with all refreshments available at reasonable prices. EFTPOS available. Finger foods and snacks available on competition days.</p>
    HTML
  },
  {
    title: "Competitions",
    position: 3,
    body: <<~HTML
      <h3>Monthly Competition</h3>
      <p>Held on the third Sunday of each month. Fish can be entered from any open Victorian waters. Entry between 5pm and 6pm on competition day.</p>
      <h3>365 Competition</h3>
      <p>Selected fish entered at a cost of $2. Entry must be presented within a month of catching. Fish can be weighed at Wonthaggi or contact 0468 349 668, or at the club on comp days.</p>
      <h3>Three Rivers Competition</h3>
      <p>Held on the Saturday following the May monthly competition. Selected fish with a barbecue at weigh-in. Minimal entry fee. Rivers: Tambo, Nicholson, and Mitchell. Visitors most welcome.</p>
      <h3>Tambo River Competition</h3>
      <p>Held on the Saturday following the October monthly competition. Only the Tambo River can be fished. Includes a barbecue at weigh-in. Minimal entry fee. Visitors most welcome.</p>
    HTML
  },
  {
    title: "How It Works",
    position: 4,
    body: <<~HTML
      <h3>Weigh-In</h3>
      <ul>
        <li>Held at the clubrooms between <strong>5pm and 6pm</strong> on competition day</li>
        <li>All fish must be weighed in <strong>scaled and gutted</strong></li>
        <li>Points are calculated per 10 grams of fish weight</li>
      </ul>
      <h3>Double Points</h3>
      <p>Each monthly competition features a selected species that earns <strong>double points</strong> at weigh-in. All other species earn regular points. Check the latest news for each month's double-point species.</p>
      <h3>Membership Card</h3>
      <p>Your membership card shows your name, member number, weigh-in times, competition days, and monthly access. It also allows you to take advantage of the double point opportunity.</p>
      <h3>Raffles &amp; Snacks</h3>
      <p>Raffles are conducted at each weigh-in with several prizes up for grabs. Finger foods and snacks are available on competition days.</p>
    HTML
  },
  {
    title: "Life Members",
    position: 5,
    body: <<~HTML
      <p>Recognising those who have given outstanding service to the club.</p>
      <p>P. Barry, D. Beech*, A. Bentick, E. Bentick*, K. Bentick*, L. Bentick, P. Clarke, C. Haines*, R. Haines, R. Hamilton*, S. Howell, I. Kent, S. McCauley, A. McFayden*, S. McFayden, G. Scott, B. Sharples, D. Sharples, H. Williams*, H. Fraser*</p>
      <p><em>* Deceased</em></p>
    HTML
  },
]

about_sections.each do |data|
  section = AboutSection.find_or_create_by!(title: data[:title]) do |s|
    s.position = data[:position]
    s.published = true
  end
  section.update!(body: data[:body]) if section.body.blank?
end
puts "  #{AboutSection.count} about sections seeded."
