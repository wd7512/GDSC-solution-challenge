# 2024 GDSC Solution Challenge

## How to run Symplify:
1. Clone the repository
2. Install the Flutter and any other additional requirements.
3. Run `flutter run`
Note: Not all body part images have been implemented so may not load! We are working on adding them all in the future but we sadly did not have enough time.

## Team
University students part of the [Google Developer Student Club at the University of Bristol](https://gdsc.community.dev/university-of-bristol/).

| Team Members    |
| -------- | 
| William Dennis  |  
| Ore Benson  | 
| Sena Polat  | 
| Lamb Chen  | 

## Problem Statement
Within national and local health services, there exist substantial challenges related to inequality in accessing healthcare. Patient-doctor communication is the root of healthcare, meaning it is essential the methods of communication used are as accessible for all. Traditional communication methods may be inaccessible or intimidating for certain demographic groups, leading to disparities in healthcare outcomes. This issue affects a broad spectrum of the population, particularly those with language or literacy barriers. For example, in the UK, the ONS 2011 Census revealed that ["People who cannot speak English well are more likely to be in poor health".](https://www.ons.gov.uk/peoplepopulationandcommunity/culturalidentity/language/articles/peoplewhocannotspeakenglishwellaremorelikelytobeinpoorhealth/2015-07-09) Doctors require a full understanding of the patients symptoms and concerns to diagnose or provide treatment. Without the understanding, there can be severe consequences to the health of the patient.

## Solution: Symplify
Symplify is a web and mobile application that aims to reduce inequalities in access to healthcare by making patient-doctor communication more accessible. The application removes the need for the patient to know English, or any verbal communication. It provides the user with images of potential symptoms they may have which they can click or tap to select from. Each potential symptom they select converted into text which gets appended to a list of "All Symptoms" they have, which they can generate a PDF of at any point to give to their doctor. This resolves the initial challenges present in patient-doctor communication by combating the first point of contact interaction. By providing a basis for the patient and doctor to hold their conversation around and insures the doctor can understand the specific symptoms the patient is experiencing, which reduces any confusion or ambiguity.

### Motivation
Being first generation and second generation immigrants, we understand first-hand the difficulties surrounding communication and accurately articulating the thoughts that we or our family members have to others. Putting this in a healthcare context, we know the NHS in the UK are under immense pressure and would like to design a solution that can help alleviate that strain. Combining these factors, we decided to design a solution to resolve difficulties within patient-doctor communication. 

### Chosen UN Sustainable Development Goals
Goal 3: Good health and Wellbeing  
Goal 10: Reduced Inequalities   

### Minimum viable product (MVP)
To create a web and mobile application that allows the user to add symptoms of basic body parts and generate a PDF of the symptoms they have. 

## Feedback / Testing / Iteration
### User Feedback
1. Could add feature for colour blind people?
2. Could export the symptoms outside the app (not just provide a list within the app).
3. Improve the inital page by allowing user to click on a specific body area rather than a button

### Improvements based on user feedback
1. Created a monochrome mode where images would be displayed with a monochrome filter to increase accessibility
2. Implemented a PDF list generator instead of having a list within the app
3. Added a body map users can click on specific body parts to search for symptoms on

## Architecutre & Technologies
Design: Draw.io   
Frontend Technologies: Flutter (Dart), Firebase, Android  
Backend Technologies: Flutter (Dart), Firebase, Google Cloud, Android      

## Future Steps
- Obtain more cohesive images (so they are in the same style) for the symptoms, potentially using Vertex AI
- Add more symptoms for each body part
  Utilise TensorFlow to add additional camera feature that enables patients to take a photo of physical symptoms to get them identified e.g. papercut  
- Improve aesthetics of the app to enhance accessibility and ease of use further

