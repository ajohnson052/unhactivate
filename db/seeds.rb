# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Uncomment these to wipe out old data in the database
Breach.delete_all
Interest.delete_all
Organization.delete_all
Category.delete_all
Article.delete_all


# haveibeenpwned.com data

# file_name = File.expand_path(File.join(File.dirname(__FILE__), 'breach_data.json'))
# breach_data = JSON.parse(File.read(file_name))
#
# (1..7).each do |i| # generate 7 generic numbered categories
#    Category.create(title: "Category#{i}")
# end
#
# last_category = 0
#
# breach_data.each do |breach|
#
#   last_category += 1 # iterate through each category
#   if last_category > 7 then last_category = 1 end
#
#   cat = Category.find_by(title: "Category#{last_category}")
#
#   cat.organizations.create(
#     domain: breach["Domain"],
#     name: breach["Name"],
#   )
#
#   Organization.last.breaches.create(
#     # name: breach["Name"], # omitted
#     title: breach["Title"],
#     # domain: breach["Domain"], # in organization
#     breach_date: breach["BreachDate"],
#     # added_date: breach["AddedDate"], # omitted
#     # pwn_count: breach["PwnCount"], # omitted
#     description: breach["Description"],
#     # is_sensitive: breach["IsSensitive"] # omitted
#   )
#
# end


file_name = File.expand_path(File.join(File.dirname(__FILE__), 'companies_categories_Jan28.json'))
companies = JSON.parse(File.read(file_name))

companies.each do |company|

  cat = Category.find_by(title: company["Category"])

  if !cat
    cat = Category.create(title: company["Category"])
  end

  cat.organizations.create(
    domain: company["Company"].downcase + '.com',
    name: company["Company"].strip
    )

end

Article.create(
  title: "How Do I Improve the Security of My Home Computer?",
  body: "<p>Following are important steps you should consider to make your home computer more secure. While no individual step will eliminate your risk, together these defense-in-depth practices will make your home computer&rsquo;s defense stronger and minimize the threat of malicious exploit.</p>

  <p>&nbsp;</p>

  <ol>
   <li><strong><em>&nbsp;Connect to a Secure Network&nbsp;</em></strong></li>
  </ol>

  <p>Once your computer is connected to the Internet, it&rsquo;s also connected to millions of other computers, which could allow attackers access to your computer. Information flows from the Internet to your home network by first coming into your modem, then into your router and finally into your computer. Although cable modem, digital subscriber line (DSL), and internet service providers (ISP) purport some level of security monitoring, it&rsquo;s crucial to secure your router&mdash;the first securable device that receives information from the Internet. Be sure to secure it&nbsp;<em>before&nbsp;</em>you connect to the Internet to improve your computer&rsquo;s security. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/ST15-002"">Securing Your Home Network</a>&nbsp;for more information.)</p>

  <ol>
   <li><strong><em>Enable and Configure a Firewall&nbsp;</em></strong></li>
  </ol>

  <p>A firewall is a device that controls the flow of information between your computer and the Internet, similar to a router. Most modern operating systems include a software firewall. In addition to the operating system&rsquo;s firewall, the majority of home routers have a firewall built in. Refer to your user&rsquo;s guide for instructions on how to enable your firewall. Once your firewall is enabled, consult the user&rsquo;s guide to learn how to configure the security settings and set a strong password to protect it against unwanted changes. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/ST04-004"">Understanding Firewalls</a>&nbsp;for more information.)</p>

  <ol>
   <li><strong><em>Install and Use Antivirus and Antispyware Software&nbsp;</em></strong></li>
  </ol>

  <p>Installing an antivirus and antispyware software program and keeping it up to date is a critical step in protecting your computer. Many types of antivirus and antispyware software can detect the possible presence of malware by looking for patterns in the files or memory of your computer. This software uses virus signatures provided by software vendors to look for malware. Antivirus vendors frequently create new signatures to keep their software effective against newly discovered malware. Many antivirus and antispyware programs offer automatic updating. Enable that feature so your software always has the most current signatures. If automatic updates aren&rsquo;t offered, be sure to install the software from a reputable source, like the vendor&rsquo;s website or a CD from the vendor. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/ST04-005"">Understanding Anti-Virus Software</a>.)</p>

  <ol>
   <li><strong><em>Remove Unnecessary Software&nbsp;</em></strong></li>
  </ol>

  <p>Intruders can attack your computer by exploiting software vulnerabilities (that is, flaws or weaknesses), so the less software you have installed, the fewer avenues for potential attack. Check the software installed on your computer. If you don&rsquo;t know what a software program does and don&rsquo;t use it, research it to determine whether it&rsquo;s necessary. Remove any software you feel isn&rsquo;t necessary after confirming it&rsquo;s safe to remove the software.&nbsp;Back up important files and data before removing unnecessary software in case you accidentally remove software essential to the operating system. If possible, locate the installation media for the software in case you need to reinstall it.</p>

  <ol>
   <li><strong><em>Modify Unnecessary Default Features&nbsp;</em></strong></li>
  </ol>

  <p>Like removing unnecessary software and disabling nonessential services, modifying unnecessary default features eliminates opportunities for attack. Review the features that came enabled by default on your computer and disable or customize those you don&rsquo;t need or plan on using. As with nonessential services, be sure to research these features before disabling or modifying them.</p>

  <ol>
   <li><strong><em>Operate Under the Principle of Least Privilege&nbsp;</em></strong></li>
  </ol>

  <p>In most instances of a malware infection, the malware can operate only under the rights of the logged-in user. To minimize the impact the malware can have if it successfully infects a computer, consider using a standard or restricted user account for day-to-day activities and only &nbsp;logging in with the administrator account (which has full operating privileges on the system) when you need to install or remove software or change system settings from the computer.</p>

  <ol>
   <li><strong><em>Secure Your Web Browser&nbsp;</em></strong></li>
  </ol>

  <p>Web browsers installed on new computers usually don&rsquo;t have secure default settings. Securing your browser is another critical step in improving your computer&rsquo;s security because an increasing number of attacks take advantage of web browsers. (See&nbsp;<a href=""https://www.us-cert.gov/publications/securing-your-web-browser"">Securing Your Web Browser</a>.)</p>

  <ol>
   <li><strong><em>Apply Software Updates and Enable Future Automatic Updates&nbsp;</em></strong></li>
  </ol>

  <p>Most software vendors release updates to patch or fix vulnerabilities, flaws, and weaknesses (bugs) in their software. Because intruders can exploit these bugs to attack your computer, keeping your software updated is important to help prevent infection. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/st04-006"">Understanding Patches</a>.)</p>

  <p>When you set up a new computer (and after you have completed the previous practices), go to your software vendors&rsquo; websites to check for and install all available updates. Enable automatic updates if your vendors offer it; that will ensure your software is always updated, and you won&rsquo;t have to remember to do it yourself. Many operating systems and software have options for automatic updates. As you&rsquo;re setting up your new computer, be sure to enable these options if offered. Be cautious, however, because intruders can set up malicious websites that look nearly identical to legitimate sites. Only download software updates directly from a vendor&rsquo;s website, from a reputable source, or through automatic updating.</p>

  <ol>
   <li><strong><em>Use Good Security Practices&nbsp;</em></strong></li>
  </ol>

  <p>You can do some simple things to improve your computer&rsquo;s security. Some of the most important are:</p>

  <ul>
   <li><strong>Use caution with email attachments and untrusted links.&nbsp;</strong>Malware is commonly spread by people clicking on an email attachment or a link that launches the malware. Don&rsquo;t open attachments or click on links unless you&rsquo;re certain they&rsquo;re safe, even if they come from a person you know. Some malware sends itself through an infected computer. While the email may appear to come from someone you know, it really came from a compromised computer. Be especially wary of attachments with sensational names, emails that contain misspellings, or emails that try to entice you into clicking on a link or attachment (for example, an email with a subject like that reads, &ldquo;Hey, you won&rsquo;t believe this picture of you I saw on the Internet!&rdquo;). (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/st04-010"">Using Caution with Email Attachments</a>.)</li>
   <li><strong>Use caution when providing sensitive information.&nbsp;</strong>Some email or web pages that appear to come from a legitimate source may actually be the work of an attacker. An example is an email claiming to be sent from a system administrator requesting your password or other sensitive information or directing you to a website requesting that information. While Internet service providers may request that you change your password, they will never specify what you should change it to or ask you what it is. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/st04-014"">Avoiding Social Engineering and Phishing Attacks</a>.)</li>
  </ul>

  <p>&nbsp;</p>

  <p><strong>Create strong passwords.&nbsp;</strong>Passwords that have eight or more characters, use a variety of uppercase and lowercase letters, and contain at least one symbol and number are best. Don&rsquo;t use passwords that people can easily guess like your birthday or your child&rsquo;s name. Password detection software can conduct dictionary attacks to try common words that may be used as passwords or conduct brute-force attacks where the login screen is pummeled with random attempts until it succeeds. The longer and more complex a password is, the harder these tools have to work to crack it. Also, when setting security verification questions, choose questions for which it is unlikely that an Internet search would yield the correct answer. (See&nbsp;<a href=""https://www.us-cert.gov/ncas/tips/ST04-002"">Choosing and Protecting Passwords</a>.)</p>
  "
)

Article.create(
  title: "What is a virus?",
  body: '<p>A computer virus is a program that spreads by first infecting files or the system areas of a computer or network router&#39;s hard drive and then making copies of itself. Some viruses are harmless, others may damage data files, and some may destroy files. Viruses used to be spread when people shared floppy disks and other portable media, now viruses are primarily spread through email messages.</p>

<p>Unlike worms, viruses often require some sort of user action (e.g., opening an email attachment or visiting a malicious web page) to spread.</p>

<p><strong>What do viruses do?</strong></p>

<p>A virus is simply a computer program--it can do anything that any other program you run on your computer can do. Some viruses are designed to deliberately damage files, and others may just spread to other computers.</p>

<p><strong>What is a worm?</strong></p>

<p>A worm is a type of virus that can spread without human interaction. Worms often spread from computer to computer and take up valuable memory and network bandwidth, which can cause a computer to stop responding. Worms can also allow attackers to gain access to your computer remotely.</p>

<p><strong>What is a Trojan horse?</strong></p>

<p>A Trojan horse is a computer program that is hiding a virus or other potentially damaging program. A Trojan horse can be a program that purports to do one action when, in fact, it is performing a malicious action on your computer. Trojan horses can be included in software that you download for free or as attachments in email messages.</p>

<p><strong>Can I get a virus by reading my email messages?</strong></p>

<p>Most viruses, Trojan horses, and worms are activated when you open an attachment or click a link contained in an email message. If your email client allows scripting, then it is possible to get a virus by simply opening a message. It&#39;s best to limit what HTML is available in your email messages. The safest way to view email messages is in plain text.</p>

<p><strong>How can I avoid a virus infection from email?</strong></p>

<p>Most users get viruses from opening and running unknown email attachments. Never open anything that is attached to an email message unless you know the contents of the file. If you receive an attachment from a familiar email address, but were not expecting anything, you should contact the sender before opening the attachment. If you receive a message with an attachment and you do not recognize the sender, you should delete the message.</p>

<p>Selecting the option to view your email messages in plain text, not HTML, will also help you to avoid a virus.</p>

<p><strong>What are some tips to avoid viruses and lessen their impact?</strong></p>

<p>&bull;Install anti-virus software from a reputable vendor. Update it and use it regularly.</p>

<p>&bull;In addition to scanning for viruses on a regular basis, install an &quot;on access&quot; scanner (included in most anti-virus software packages) and configure it to start each time you start up your computer. This will protect your system by checking for viruses each time you run an executable file.</p>

<p>&bull;Use a virus scan before you open any new programs or files that may contain executable code. This includes packaged software that you buy from the store as well as any program you might download from the Internet.</p>

<p>&bull;If you are a member of an online community or chat room, be very careful about accepting files or clicking links that you find or that people send you within the community.</p>

<p>Make sure you back up your data (documents, bookmark files, important email messages, etc.) on disc so that in the event of a virus infection, you do not lose valuable work.</p>
</div>'
)

Article.create(
  title: "How do you choose a good password?",
  body: "<p>Most people use passwords that are based on personal information and are easy to remember. However, that also makes it easier for an attacker to guess or &quot;crack&quot; them. Consider a four-digit PIN number. Is yours a combination of the month, day, or year of your birthday? Or the last four digits of your social security number? Or your address or phone number? Think about how easily it is to find this information out about somebody. What about your email password&mdash;is it a word that can be found in the dictionary? If so, it may be susceptible to &quot;dictionary&quot; attacks, which attempt to guess passwords based on words in the dictionary.</p>

  <p>Although intentionally misspelling a word (&quot;daytt&quot; instead of &quot;date&quot;) may offer some protection against dictionary attacks, an even better method is to rely on a series of words and use memory techniques, or mnemonics, to help you remember how to decode it. For example, instead of the password &quot;hoops,&quot; use &quot;IlTpbb&quot; for &quot;[I] [l]ike [T]o [p]lay [b]asket[b]all.&quot; Using both lowercase and capital letters adds another layer of obscurity. Your best defense, though, is to use a combination of numbers, special characters, and both lowercase and capital letters. Change the same example we used above to &quot;Il!2pBb.&quot; and see how much more complicated it has become just by adding numbers and special characters.</p>

  <p>Longer passwords are more secure than shorter ones because there are more characters to guess, so consider using passphrases when you can. For example, &quot;This passwd is 4 my email!&quot; would be a strong password because it has many characters and includes lowercase and capital letters, numbers, and special characters. You may need to try different variations of a passphrase&mdash;many applications limit the length of passwords, and some do not accept spaces. Avoid common phrases, famous quotations, and song lyrics.</p>

  <p>Don&#39;t assume that now that you&#39;ve developed a strong password you should use it for every system or program you log into. If an attacker does guess it, he would have access to all of your accounts. You should use these techniques to develop unique passwords for each of your accounts.</p>

  <p>Here is a review of tactics to use when choosing a password:</p>"
)

opm = Organization.find_by(name: "Office of Personnel Management (OPM)")

opm.breaches.create(
  title: "OPM",
  breach_date: "2015-06-15",
  description: "<p>The United States Office of Personnel Management (OPM) announced today that it has suffered a massive data breach in which the records of more than 22 million individuals were compromised.</p>

  <p><strong>What was compromised: </strong></p>

  <p>Information targeted in the breach included personally identifiable information such as Social Security numbers, as well as names, dates and places of birth, and addresses.</p>

  <p>The hack went deeper than initially believed and likely involved theft of detailed security-clearance-related background information, possibly even including biometric data.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>OPM announced that it plans to offer credit report access, credit monitoring, and identity theft insurance and recovery services to potentially affected individuals. Take advantage of this offer.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.</li>
  </ul>"
)

centene = Organization.find_by(name: "Centene Corp")

centene.breaches.create(
  title: "Centene Corp.",
  breach_date: "2016-01-26",
  description: "<p>Health insurer Centene announced today that six hard drives containing personal information on almost one million customers have been lost.</p>

  <p><strong>What was compromised: </strong></p>

  <p>The lost hard drives included data such as enrollees&#39; names, addresses, birth dates, Social Security numbers, Centene ID numbers and other health information.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize any free identification monitoring services Centene decides to offer.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.&nbsp;</li>
  </ul>"
)

blue_shield = Organization.find_by(name: "Blue Shield of California")

blue_shield.breaches.create(
  title: "Blue Cross of California",
  breach_date: "2016-01-14",
  description: "<p>Blue Shield of California says the personal information of almost 21,000 people who enrolled in coverage between October 2013 and December 2015 may have been exposed as a result of a data breach at a third-party vendor.</p>

  <p><strong>What was compromised: </strong></p>

  <p>The information potentially exposed includes names, addresses, birthdates and Social Security numbers of customers. This was allegedly the result of log-in credentials for certain Blue Shield customer service representatives being misused.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize Blue Cross&rsquo;s offer of a free one-year membership in Experian&#39;s ProtectMyID Alert service if you have been affected.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.&nbsp;</li>
  </ul>"
)

time_warner = Organization.find_by(name: "Time Warner")

time_warner.breaches.create(
  title: "Time Warner Cable",
  breach_date: "2016-01-07",
  description: "<p>320,000 Time Warner Cable customers could be affected in a security breach announced recently by the company</p>

  <p><strong>What was compromised: </strong></p>

  <p>Email and password information of customers were likely obtained through downloaded malware during a phishing attack or indirectly through data breaches of other companies that stored Time Warner Cable customer information.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize Blue Cross&rsquo;s offer of a free one-year membership in Experian&#39;s ProtectMyID Alert service if you have been affected.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.</li>
  </ul>"
)
