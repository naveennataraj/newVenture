class ContentFrameworkMenu {
  final String title;
  final String paragraph1;
  final String paragraph2;
  final String paragraph3;

  ContentFrameworkMenu(
      {this.title,
        this.paragraph1,
        this.paragraph2,
        this.paragraph3,
      });
}

List<ContentFrameworkMenu> menuContents = [
  ContentFrameworkMenu(
    title: 'Welcome to iVenture!',
    paragraph1: "This application helps aspiring Entreprenuers ideate, create product concepts, build business models around those concepts and then help validate them.",
    paragraph2: "In case you already have a product concept in mind, you can skip the product concept step and choose to directly create a business model for that concept.",

  ),
  ContentFrameworkMenu(
    title: 'Welcome to a business model development exercise using the Blitz Canvas methodology.',
    paragraph1: "In the NEXT TEN STEPS, we will go through the steps of developing a SAMPLE business model using the Blitz Canvas methodology. For the purpose of this exercise, the fictional product offered to the customer is a To-Do list application and the business model will be built around this application concept.",
    paragraph2: "PLEASE NOTE: THIS IS AN INNOVATION DRIVEN NEW PRODUCT CONCEPTUALIZATION EXERCISE. THE ENTRIES FOR EACH STEP HAS ALREADY BEEN FILLED IN.",
    paragraph3: "Please choose the -Let's get started- button in step 1 to get started with the process.",
  ),

];