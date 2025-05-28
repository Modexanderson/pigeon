extension StringExtension on String {
  String capitalizeFirstLetter() {
    if(this == "" || isEmpty) {
        return this;
    } else {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
  }
} 

