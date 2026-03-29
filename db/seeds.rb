User.find_or_create_by!(username: "wacadmin") do |user|
  user.email_address = "admin@wonthaggiangling.com.au"
  user.password = "password"
  user.password_confirmation = "password"
end

puts "Admin user created: wacadmin / password"

# Fish Points
puts "Seeding fish points..."
[
  { name: "Garfish", points: 60, position: 1 },
  { name: "School Whiting", points: 60, position: 2 },
  { name: "Sweep", points: 30, position: 3 },
  { name: "King George Whiting", points: 28, position: 4 },
  { name: "Mullet", points: 28, position: 5 },
  { name: "Sole/Flounder", points: 28, position: 6 },
  { name: "Magpie Bream", points: 26, position: 7 },
  { name: "Trumpeter", points: 26, position: 8 },
  { name: "Luderick", points: 25, position: 9 },
  { name: "Bream", points: 25, position: 10 },
  { name: "Redfin", points: 23, position: 11 },
  { name: "Silver Trevally", points: 20, position: 12 },
  { name: "Estuary Perch", points: 20, position: 13 },
  { name: "Fresh Water Trout", points: 15, position: 14 },
  { name: "Flathead", points: 15, notes: "All species", position: 15 },
  { name: "Tailor", points: 15, position: 16 },
  { name: "Australian Salmon", points: 12, position: 17 },
  { name: "Snook", points: 12, position: 18 },
  { name: "Grass Whiting", points: 10, position: 19 },
  { name: "Snapper", points: 8, position: 20 },
  { name: "Gummy", points: 8, position: 21 },
  { name: "Barracouta", points: 8, position: 22 },
  { name: "Pike", points: 8, position: 23 },
  { name: "Tuna", points: 0, notes: "365 Comp only", position: 24 },
  { name: "Kingfish", points: 0, notes: "365 Comp only", position: 25 },
].each do |data|
  FishPoint.find_or_create_by!(name: data[:name]) do |fp|
    fp.points = data[:points]
    fp.notes = data[:notes]
    fp.position = data[:position]
  end
end
puts "  #{FishPoint.count} fish species seeded."

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

# Committee Members
puts "Seeding committee members..."
[
  { role: "President", name: "Stuart Lowe", phone: "0407 688 357", position: 1 },
  { role: "Vice President", name: "Stephen Howell", phone: "0438 755 503", position: 2 },
].each do |data|
  CommitteeMember.find_or_create_by!(role: data[:role]) do |member|
    member.name = data[:name]
    member.phone = data[:phone]
    member.position = data[:position]
  end
end
puts "  #{CommitteeMember.count} committee members seeded."

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
