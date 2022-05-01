class RecentUser {
  final String? icon, name, date, posts, role, email;

  RecentUser(
      {this.icon, this.name, this.date, this.posts, this.role, this.email});
}

List recentUsers = [
  RecentUser(
    icon: "images/icons/xd_file.svg",
    name: "Deniz Çolak",
    role: "Violin Course",
    email: "de***ak@huawei.com",
    date: "01-03-2021",
    posts: "4",
  ),
  RecentUser(
    icon: "images/icons/Figma_file.svg",
    name: "S*** Ç****",
    role: "Piano Course",
    email: "se****k1@google.com",
    date: "27-02-2021",
    posts: "19",
  ),
  RecentUser(
    icon: "images/icons/doc_file.svg",
    name: "N***** D****",
    role: "Solution Architect",
    email: "ne****tr@google.com",
    date: "23-02-2021",
    posts: "32",
  ),
  RecentUser(
    icon: "images/icons/sound_file.svg",
    name: "B***** K****",
    role: "Project Manager",
    email: "bu****lk@google.com",
    date: "21-02-2021",
    posts: "3",
  ),
  RecentUser(
    icon: "images/icons/media_file.svg",
    name: "A**** S**** K****",
    role: "Line Manager",
    email: "ah****az@google.com",
    date: "23-02-2021",
    posts: "2",
  ),
  RecentUser(
    icon: "images/icons/pdf_file.svg",
    name: "T***** S****",
    role: "UI/UX Designer",
    email: "te****cu@google.com",
    date: "25-02-2021",
    posts: "3",
  ),
  RecentUser(
    icon: "images/icons/excle_file.svg",
    name: "K***** D****",
    role: "Business Analyst",
    email: "ke****an@gmail.com",
    date: "25-02-2021",
    posts: "34",
  ),
];
