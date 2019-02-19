class LocaleHolder {
  static String getValue(String key) {
    final defaultLocale = "pt";
    return _localizedValues[defaultLocale][key] ?? capitalizeFirstLetterOnly(key);
  }
 
  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      //Recorrent
      YES: "Yes",
      NO: "No",
      CANCEL: "Cancel",
      CONFIRM: "Are you sure?",
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
      EVALUATION: "Avaliação",
      EVALUATION_EXAMPLE: "Ex.: 9.5",
      ASSIGN: "Assign",
      ALERT_EMPTY_GRADE: "Can't give a blank evaluation!",
      //Tabs
      OVERVIEW: "Overview",
      SIGNING_OFF: "Signing off...",
      SUBJECTS: "Subjects",
      SEARCH: "Search",
      PROFILE: "Profile",
      SCHEDULE: "Schedule",
      CALENDAR: "Calendar",
      QUICK_ACCESS: "Quick Access",
      SETTINGS: "Settings",
      SIGN_OFF: "Sign off",
    },
    "pt": {
      //Recorrent
      YES: "Sim",
      NO: "Não",
      CANCEL: "Cancelar",
      CONFIRM: "Tem a certeza?",
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
      SUBJECTS: "Cadeiras",
      SEARCH: "Pesquisa",
      PROFILE: "Perfil",
      SCHEDULE: "Horário",
      CALENDAR: "Calendário",
      QUICK_ACCESS: "Atalhos",
      SETTINGS: "Definições",
      SIGN_OFF: "Sair da Aplicação",
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
