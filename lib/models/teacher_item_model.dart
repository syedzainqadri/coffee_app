class TeacherItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String subject;

  TeacherItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.subject,
  });

  // mock data
  // 10 items
  // price beetwen 2 and 8
  // image with path assets/images/teachers/teacher-{id}.png
  static List<TeacherItem> mockItems = [
    TeacherItem(
      id: '1',
      name: 'Alice jack',
      description:
          'Passionate AI & Machine Learning educator with deep expertise in simplifying complex concepts. Equips students with practical skills through hands-on projects. Fosters a dynamic learning environment that encourages curiosity and critical thinking.',
      image: 'assets/images/teachers/teacher-0.png',
      price: 50.0,
      subject: 'AI & Machine Learning',
    ),
    TeacherItem(
      id: '5',
      name: 'Jane Doe',
      description:
          'Professional Physics Teacher from london england. Available to teach A and O level students at their decided time. You can always talk to me before you book the service.',
      image: 'assets/images/teachers/teacher-4.png',
      price: 6.0,
      subject: 'Physics',
    ),
    TeacherItem(
        id: '4',
        name: 'Lionardo suckuira',
        description:
            'Experienced Linguistics teacher fostering deep language exploration. Expertise in phonetics, syntax, and semantics. Inspires curiosity, analytical thinking in students.',
        image: 'assets/images/teachers/teacher-3.png',
        price: 50.0,
        subject: 'Linguistics'),
    TeacherItem(
      id: '9',
      name: 'Maria Mestro',
      description:
          'Experienced Front End mentor fostering modern web development skills. Expert in HTML, CSS, and JavaScript, with a passion for responsive design and user-centric interfaces. Guiding students to create engaging and accessible websites through hands-on projects and practical insights.',
      image: 'assets/images/teachers/teacher-8.png',
      price: 30.0,
      subject: 'Front End',
    ),
    TeacherItem(
      id: '3',
      name: 'Deniel Tiest',
      description:
          'Experienced Motion Graphics instructor adept at teaching the art of dynamic visual storytelling. Proficient in industry-standard software and techniques. Inspires students to master animation, typography, and design, fostering their creativity.',
      image: 'assets/images/teachers/teacher-2.png',
      price: 40.0,
      subject: 'Motion Graphics',
    ),
    TeacherItem(
      id: '2',
      name: 'Florance Hancie',
      description:
          'Experienced Data Science instructor adept at demystifying complex concepts. Equips students with practical skills in statistics, machine learning, and data manipulation. Fosters a dynamic learning environment, blending theory with hands-on projects.',
      image: 'assets/images/teachers/teacher-1.png',
      price: 45.0,
      subject: 'Data Science',
    ),
    TeacherItem(
      id: '6',
      name: 'Fernando Canco',
      description:
          'Dedicated math educator passionate about fostering numerical literacy. Creates engaging lessons to demystify complex concepts, cultivating a supportive classroom. Empowers students with problem-solving skills, instilling confidence for real-world application.',
      image: 'assets/images/teachers/teacher-5.png',
      price: 35.0,
      subject: 'Mathematics',
    ),
    TeacherItem(
      id: '7',
      name: 'Zubair Ibrahim',
      description:
          'Experienced Quantum Physics educator passionate about illuminating the mysteries of the universe. Engages students with dynamic lessons, simplifying complex concepts. Fosters critical thinking and curiosity through hands-on experiments, cultivating a lifelong love for science.',
      image: 'assets/images/teachers/teacher-6.png',
      price: 30.0,
      subject: 'Quantum Physics',
    ),
    TeacherItem(
      id: '8',
      name: 'Michle chemist',
      description:
          'Michle is a Chemistry teacher, he has been teaching in multiple institutes accross europ, fluent in Gernam, English and French. You can book him for your O levels - post graduation chemistry tutions. ',
      image: 'assets/images/teachers/teacher-7.png',
      price: 20.0,
      subject: 'Chemistry',
    ),
  ];
}
