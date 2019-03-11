class LocaleHolder {
  static String LOCALE = "";

  static String getValue(String key) {
    return _localizedValues[LOCALE][key] ?? capitalizeFirstLetterOnly(key);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      //Recorrent
      YES: "Yes",
      NO: "No",
      CANCEL: "Cancel",
      CONFIRM: "Are you sure?",
      SAVE: "Save",
      //Login
      GOOGLE_SIGN_IN: "Sign in with Google",
      SIGN_IN: "Sign in",
      VALIDATE_PASS: "Invalid Password",
      VALIDATE_EMAIL: "Invalid Email",
      OR_OPTION: "  Or  ",
      //Create Subjects
      CREATE_SUBJECTS: "Create Subjects",
      SUBJECT_NAME: "Name:",
      EXAMPLE_NAME: "Example: Eletrónica 1",
      SUBJECT_DESCRIPTION: "Description:",
      EXAMPLE_DESCRIPTION: "Topics covered",
      CREATE: "Create",
      ALERT_EMPTY_NAME: "Can't create a subject without a name!",
      ALERT_REPEATED_NAME: "There's alreay a subject with that name!",
      //Give Grade
      EVALUATION: "Evaluation",
      EVALUATION_EXAMPLE: "Example: 9.5",
      ASSIGN: "Assign",
      ALERT_EMPTY_GRADE: "Can't give a blank evaluation!",
      //Tabs
      OVERVIEW: "Overview",
      SIGNING_OFF: "Signing off...",
      PROFILE: "Profile",
      SCHEDULE: "Schedule",
      CALENDAR: "Calendar",
      QUICK_ACCESS: "Quick Access",
      SETTINGS: "Settings",
      SIGN_OFF: "Sign off",
      //Schedule
      MONDAY: "Monday",
      TUESDAY: "Tuesday",
      WEDNESDAY: "Wednesday",
      THURSDAY: "Thursday",
      FRIDAY: "Friday",
      //Search Page
      SEARCH_OPTION: "Search Options:",
      STUDENTS: "Students",
      TEACHERS: "Teachers",
      SUBJECTS: "Subjects",
      SEARCH: "Search",
      //Subject Info
      ENROLLED_STUDENTS: "Enrolled Students List",
      //User Profile
      UPDATE: "Update",
      UPDATE_PROFILE: "Update User Profile",
      FIRST_NAME: "First name: ",
      LAST_NAME: "Last name: ",
      COURSE_GPA: "Course GPA: ",
      FULL_NAME: "Full Name: ",
      USER_NUMBER: "User Number: ",
      COURSE: "Course: ",
      START_DATE: "Starting Date: ",
      //Settings
      LANGUAGE: "Language",
      PORTUGUESE: "Portuguese",
      ENGLISH: "English",
      //Calendar
      JANUARY: "January",
      FEBRUARY: "February",
      MARCH: "March",
      APRIL: "April",
      MAY: "May",
      JUNE: "June",
      JULY: "July",
      AUGUST: "August",
      SEPTEMBER: "September",
      OCTOBER: "October",
      NOVEMBER: "November",
      DECEMBER: "December"
    },
    "pt": {
      //Recorrent
      YES: "Sim",
      NO: "Não",
      CANCEL: "Cancelar",
      CONFIRM: "Tem a certeza?",
      SAVE: "Guardar",
      //Login
      GOOGLE_SIGN_IN: "Entrar com o Google",
      SIGN_IN: "Entrar",
      VALIDATE_PASS: "Password Inválida",
      VALIDATE_EMAIL: "Email Inválido",
      OR_OPTION: "  Ou  ",
      //Create Subjects
      CREATE_SUBJECTS: "Criar Cadeiras",
      SUBJECT_NAME: "Nome:",
      EXAMPLE_NAME: "Exemplo: Eletrónica 1",
      SUBJECT_DESCRIPTION: "Descrição:",
      EXAMPLE_DESCRIPTION: "Temas abordados",
      CREATE: "Criar",
      ALERT_EMPTY_NAME: "Não é possível criar uma cadeira sem nome!",
      ALERT_REPEATED_NAME: "Já existe uma cadeira com esse nome!",
      //Give Grade
      EVALUATION: "Avaliação",
      EVALUATION_EXAMPLE: "Example: 9.5",
      ASSIGN: "Atribuir",
      ALERT_EMPTY_GRADE: "Não é possível atribuir uma nota vazia!",
      //Tabs
      OVERVIEW: "Resumo",
      SIGNING_OFF: "A sair da aplicação...",
      PROFILE: "Perfil",
      SCHEDULE: "Horário",
      CALENDAR: "Calendário",
      QUICK_ACCESS: "Atalhos",
      SETTINGS: "Definições",
      SIGN_OFF: "Sair da Aplicação",
      //Schedule
      MONDAY: "Segunda-feira",
      TUESDAY: "Terça-feira",
      WEDNESDAY: "Quarta-feira",
      THURSDAY: "Quinta-feira",
      FRIDAY: "Sexta-feira",
      //Search Page
      SEARCH_OPTION: "Opções de Procura:",
      STUDENTS: "Estudantes",
      TEACHERS: "Professores",
      SUBJECTS: "Cadeiras",
      SEARCH: "Pesquisa",
      //Subject Info
      ENROLLED_STUDENTS: "Lista de Alunos Inscritos",
      //User Profile
      UPDATE: "Atualizar",
      UPDATE_PROFILE: "Atualizar Perfil de Utilizador",
      FIRST_NAME: "Primeiro nome: ",
      LAST_NAME: "Último nome: ",
      COURSE_GPA: "Média de Curso: ",
      FULL_NAME: "Nome Completo: ",
      USER_NUMBER: "Número de Utilizador: ",
      COURSE: "Curso: ",
      START_DATE: "Data de Início: ",
      //Settings
      LANGUAGE: "Idioma",
      PORTUGUESE: "Português",
      ENGLISH: "Inglês",
      //Calendar
      JANUARY: "Janeiro",
      FEBRUARY: "Fevereiro",
      MARCH: "Março",
      APRIL: "Abril",
      MAY: "Maio",
      JUNE: "Junho",
      JULY: "Julho",
      AUGUST: "Agosto",
      SEPTEMBER: "Setembro",
      OCTOBER: "Outubro",
      NOVEMBER: "Novembro",
      DECEMBER: "Dezembro"
    },
  };

  static String capitalizeFirstLetterOnly(String input) {
    if (input.length > 1) {
      return input[0].toUpperCase() + input.substring(1).toLowerCase();
    }
    return input.toUpperCase();
  }
}

const YES = "YES";
const NO = "NO";
const CANCEL = "CANCEL";
const CONFIRM = "CONFIRM";
const GOOGLE_SIGN_IN = "SIGN_IN_WITH_GOOGLE";
const SIGN_IN = "SIGN_IN";
const VALIDATE_PASS = "VALIDATE_PASS";
const VALIDATE_EMAIL = "VALIDATE_EMAIL";
const OR_OPTION = "OR_OPTION";
const CREATE_SUBJECTS = "CREATE_SUBJECTS";
const SUBJECT_NAME = "SUBJECT_NAME";
const EXAMPLE_NAME = "EXAMPLE_NAME";
const SUBJECT_DESCRIPTION = "SUBJECT_DESCRIPTION";
const EXAMPLE_DESCRIPTION = "EXAMPLE_DESCRIPTION";
const CREATE = "CREATE";
const ALERT_EMPTY_NAME = "ALERT_EMPTY_NAME";
const ALERT_REPEATED_NAME = "ALERT_REPEATED_NAME";
const EVALUATION = "EVALUATION";
const EVALUATION_EXAMPLE = "EVALUATION_EXAMPLE";
const ASSIGN = "ASSIGN";
const ALERT_EMPTY_GRADE = "ALERT_EMPTY_GRADE";
const OVERVIEW = "OVERVIEW";
const SIGNING_OFF = "SIGNING_OFF";
const SUBJECTS = "SUBJECTS";
const SEARCH = "SEARCH";
const PROFILE = "PROFILE";
const SCHEDULE = "SCHEDULE";
const CALENDAR = "CALENDAR";
const QUICK_ACCESS = "QUICK_ACCESS";
const SETTINGS = "SETTINGS";
const SIGN_OFF = "SIGN_OFF";
const MONDAY = "MONDAY";
const TUESDAY = "TUESDAY";
const WEDNESDAY = "WEDNESDAY";
const THURSDAY = "THURSDAY";
const FRIDAY = "FRIDAY";
const SEARCH_OPTION = "SEARCH_OPTION";
const STUDENTS = "STUDENTS";
const TEACHERS = "TEACHERS";
const ENROLLED_STUDENTS = "ENROLLED_STUDENTS";
const UPDATE_PROFILE = "UPDATE_PROFILE";
const FIRST_NAME = "FIRST_NAME";
const LAST_NAME = "LAST_NAME";
const SAVE = "SAVE";
const COURSE_GPA = "COURSE_GPA";
const UPDATE = "UPDATE";
const FULL_NAME = "FULL_NAME";
const USER_NUMBER = "USER_NUMBER";
const COURSE = "COURSE";
const START_DATE = "START_DATE";
const LANGUAGE = "LANGUAGE";
const PORTUGUESE = "PORTUGUESE";
const ENGLISH = "ENGLISH";
const JANUARY = "JANUARY";
const FEBRUARY = "FEBRUARY";
const MARCH = "MARCH";
const APRIL = "APRIL";
const MAY = "MAY";
const JUNE = "JUNE";
const JULY = "JULY";
const AUGUST = "AUGUST";
const SEPTEMBER = "SEPTEMBER";
const OCTOBER = "OCTOBER";
const NOVEMBER = "NOVEMBER";
const DECEMBER = "DECEMBER";
