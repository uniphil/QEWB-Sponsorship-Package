from django.shortcuts import render_to_response

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
                'content': 'The Queen\'s chapter of Engineers Without Borders is part of a 3000 member national organization that spans over ___ over 36 university campuses and professional networkscampuses across Canada. , and chapters. We are a group of multidisciplinary students that are passionate about change to increase opportunities for rural African by alleviating social and economical inequalities.',
            },
            {
                'name': 'What We Do',
                'shortname': 'Action',
                'slug': 'what-we-do',
                'content': '',
            },
            {
                'name': 'Events',
                'shortname': 'Events',
                'slug': 'events',
                'content': 'hello hello',
            },
            {
                'name': 'Budget',
                'shortname': 'Budget',
                'slug': 'budget',
                'content': 'money money money',
            },
            {
                'name': 'Contact',
                'shortname': 'Contact',
                'slug': 'contact',
                'content': 'get in touch...',
            }
            ]
        }
    return render_to_response('home.html', content)