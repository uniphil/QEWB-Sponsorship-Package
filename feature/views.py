# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, redirect

def home(request):
    content = {
        'meta': {
            'title': 'Queen\'s Engineers Without Borders',
            'subtitle': 'Sponsorship Package 2013',
        },
        'sections': [
            {
                'name': 'Who We Are',
                'shortname': 'About',
                'slug': 'who-we-are',
                'photo': '/static/img/change-leader.jpg',
                'content': 'The Queen\'s chapter of Engineers Without Borders is part of a 3000 member national organization that spans over 36 university campuses and professional networks across Canada.  We are a group of multidisciplinary students that are passionate about global change to increase opportunities for rural African by alleviating social and economical inequalities.',
            },
            {
                'name': 'What We Do',
                'shortname': 'Action',
                'slug': 'what-we-do',
                'content': 'At Queen\'s, we invest in both Canadian and overseas programs.  In Canada, we are focused on four ventures: political advocacy, fair trade, global engineering, and youth engagement.  We send one student every year to work on an overseas project with a full time EWB staff member, either in Ghana, Malawi, Uganda or Burkina Faso.  We have a regular presence on Queen\'s campus, and attract over 100 students each year. In 2011, the Queen\'s chapter won the prestigious award of Chapter of the Year for all the great work and programs we have implemented locally in Kingston, as well as overseas.',
                'list': {
                    'type': 'slider',
                    'projects': [
                        {
                            'title': 'Member Learning',
                            'slug': 'member-learning',
                            'content': 'EWB strongly values and learning, critical thinking and discussion. An average of 50 students meet weekly at the Member Learning meetings which provide a basis for peer-to-peer learning and discussion. At the meetings, students and faculty improve their development knowledge, build an understanding of the work EWB does in Canada and in Africa, become global citizens, and improve leadership skills. In the future, Member Learning is looking to host guest speakers from across the country to discuss poverty, access to clean water, and the impact of EWB projects.',
                        },
                        {
                            'title': 'Political Advocacy',
                            'slug': 'political-advocacy',
                            'content': 'To make Canada a more pro-development country, Canadian policies need to be altered and regulated. The need for informed Canadian citizens and politicians is what drives the work in EWB advocacy. A main focus within advocacy is improving the Canadian aid sector. We are carrying momentum over from last year\'s successful passing of the International Aid Transparency Initiative (IATI).  Another Non-Government Organization, <em>Publish What You Fund</em>, remarked, "Engineers Without Borders Canada have been working towards this development with impressive campaigning throughout 2011. We congratulate them on keeping up the pressure to realise this huge achievement." Our chapter played an important part in educating the public, signing petitions, and holding a mass advocacy event to engage our student community in Canada\'s foreign aid policy. Queen’s chapter of EWB advocacy is working on building a relationship with Ted Hsu, the Member of Parliament for Kingston and the Islands.  In addition, we are supporting the national EWB advocacy project of getting the Canadian government to pilot a Cash on Delivery aid initiative.',
                        },
                        {
                            'title': 'Queen\'s Global Innovation Conference',
                            'slug': 'qgic',
                            'content': 'The Queen Global Innovation Conference (QGIC) is in its second year or existence.  It is an unique conference at Queen\'s as it attracts a multi-disciplinary student base who are passionate about global complexities such as climate change, water scarcity, food shortages and energy management. These pressing issues are looked at through a multi-disciplinary lens, and after a successful inaugural year, this conference is continuing with huge momentum.  The conference spans over a weekend, and attracts delegates from a multi-disciplinary background who are passionate about positive change, and solving global complexities.',
                        },
                        {
                            'title': 'Global Engineering',
                            'slug': 'global-engineering',
                            'content': 'The mandate of Global Engineering is to maintain and develop relations between Queen’s Engineers Without Borders and the Faculty of  Applied Science and Engineering. Engineers Without Borders believes that an engineer must know how to identify projects that are technically sound, but may be socially flawed and be able to realize the impacts of  his/her decisions. We have sponsored six different first year engineering projects, and have had an impact in the curriculum development and enhancement of our engineering programs at Queen\'s.  As well, Engineers Without Borders is the national provider for National Engineering Month (occurs every March), which promotes globally minded engineering to elementary students, current engineering students and the general public.',
                        },
                        {
                            'title': 'Fair Trade',
                            'slug': 'fair-trade',
                            'content': 'To reduce extreme poverty we need Canadians that are committed and that take action to reduce poverty. This requires not only awareness, but also an attitude and behavioral change. Currently, we are working to make the Queen\'s University campus a designated Fair Trade campus. We received a lot of momentum in 2012 through our inaugural Fair Trade week, which culminated in a world-record breaking event that rose awareness about fair trade and sustainable farming. With high momentum and a dedicated team we are looking forward to Queen\'s getting it\'s designation and becoming the first fair-trade campus in Eastern Canada by the end of this year.',
                        },
                        {
                            'title': 'Youth Venture',
                            'slug': 'youth-venture',
                            'content': 'Youth Venture aims to engage members and the greater community at Queen\'s to participate in outreach events to youth, educators and professionals in the Kingston area. The outreach program involves conducting workshops for both schools and local engineers on topics related to EWB\'s work. Additionally, we hold workshops for teachers where we give ideas on how to incorporate global issues more in their classrooms. Outside the classroom, we are supporting a social justice club at a local high school and hold fun and interactive activities at the Kingston Boys and Girls club. This achieves the goal of connecting with youth but also engaging the broader Queen\'s community on important issues and local youth outreach. In connection with EWB\'s Global Engineering program the goal of this program is to share EWB\'s work and foster an interest in development and global engineering.'
                        },
                        {
                            'title': 'Overseas Programs',
                            'slug': 'overseas-programs',
                            'content': 'Junior Fellowship (JF) program is a sixteen month leadership program, that climaxes with a four month internship to work alongside full time EWB volunteers in either Ghana, Malawi, Burkina Faso or Uganda.  We have had two previous students complete the JF program, and hope to start sending more than one student each year.  Part of the JF placement is returning to the university campus, and promoting intelligent development, systemic thinking, and acting as a resource and mentor to the next student going overseas. Maclean Maclean was sent to Ghana to work as.... Nicholas In the summer of 2012, Nicholas traveled to Ghana, West Africa, on the Junior Fellowship program. Working to build Voto, a mobile social accountability tool which serves to connect Africans to key policy and decision-makers, he travelled the country eliciting public opinions, building partnerships and refining the technology. Now, having returned to Queen’s University, Nicholas shares his insights into the complexities of business growth in the developing world, the power of tactical innovations to change systems, and the notion of pioneering to achieve the impossible. Through organized presentations on campus, member learning forums and the mentorship of subsequent Junior Fellows, he strives to create the utmost impact on the Queen’s EWB chapter and the greater university community at-large.',
                        },
                    ],
                },
            },
            {
                'name': 'Events',
                'shortname': 'Events',
                'slug': 'events',
                'content': '',
                'list': {
                    'type': 'simple',
                    'projects': [
                        {
                            'title': 'Run to End Poverty',
                            'slug': 'R2EP',
                            'image': 'r2ep.jpg',
                            'content': 'The Run to End Poverty is a Canada wide movement where runners fundraise money to support Engineers Without Border\'s programs.  We participate in our first Run to End Poverty in October 2012 in partnership with the Toronto Marathon.  From the Queen\'s chapter, we sent 18 students down to Toronto not only fundraised money for our chapter, but also raised a lot of awareness about intelligent development and EWB\'s programs.  In total, over 300 EWB members participated in the Toronto run alone, with runs spanning across Canada from Vancouver to St. Johns.',
                        },
                        {
                            'title': 'Pumpkin Smash',
                            'slug': 'pumpkin-smash',
                            'image': 'psmash.jpg',
                            'content': 'Pumpkin smash is an annual tradition on the Queen\'s campus where we hoist a giant 1000 lb pumpkin with a crane, and smash it.  This event brings the campus community together and has served as a platform to bring awareness to various issues that EWB chooses to promote each year.  Past examples include promoting the ACT campaign (making aid more accountable, creative and transparent), as well as the International Aid Transparency Initiative (IATI).  This event also serves as a major fundraiser, and continually attracts over 300 students and faculty each year.',
                        },
                        {
                            'title': 'National Conference',
                            'slug': 'national-conference',
                            'image': 'natconf.jpg',
                            'content': 'The national conference for Engineers Without Borders occurs annually and brings together over 700 students and professionals to engage in exciting discussions regarding international aid reform, systemic change, and EWB\'s ventures in Africa and Canada.  This is an excellent opportunity for our chapter members to be immersed in an inspiring atmosphere, surrounded by similarly passionate minded delegates from across Canada.',
                        },
                    ],
                },
            },
            {
                'name': 'Chapter Budget',
                'shortname': 'Budget',
                'slug': 'budget',
                'content': 'The Queen\'s Chapter of Engineers Without Borders relies heavily on donations and funds raised by our chapter members.  Our annual budget approaches $20 000; the majority of our funds go to support the junior fellow program, as well our Canadian programs.  We strive to keep administrative and overhead costs low.  The following pie chart is a great visual breakdown of our chapter expenses.',
                'data': [
                    {
                        'program': 'Junior Fellow',
                        'cost': 7400.00,
                        'slug': 'budget-jf',
                        'colour': 'hsl(0, 0.5, 0.9)',
                    },
                    {
                        'program': 'National Conference',
                        'cost': 6400.00,
                        'slug': 'budget-conference',
                        'colour': 'hsl(30, 0.5, 0.9)',
                    },
                    {
                        'program': 'Youth Engagement & Global Engineering',
                        'cost': 3800.00,
                        'slug': 'budget-yege',
                        'colour': 'hsl(60, 0.5, 0.9)',
                    },
                    {
                        'program': 'Fair Trade Advocacy',
                        'cost': 1400.00,
                        'slug': 'budget-fairtrade',
                        'colour': 'hsl(80, 0.5, 0.9)',
                    },
                    {
                        'program': 'Recruitment/ Administrative',
                        'cost': 1000.00,
                        'slug': 'budget-admin',
                        'colour': 'hsl(120, 0.5, 0.9)',
                    },
                ],
            },
            {
                'name': 'Contact Us',
                'shortname': 'Contact',
                'slug': 'contact',
                'content': 'Thank you for taking the time to read through our sponsorship package. If you have any questions or concerns please do not hesitate to contact us. <em>ATTN: Melissa da Cunha</em>',
            },
        ],
        }
    return render_to_response('home.html', content)

def sendemail(request):
    if request.method != 'POST':
        return redirect('/#contact')

    # send the message...
    return redirect('home')