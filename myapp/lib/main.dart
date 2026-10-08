import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIODATA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BiodataFormScreen(),
    );
  }
}

class BiodataFormScreen extends StatefulWidget {
  const BiodataFormScreen({super.key});

  @override
  State<BiodataFormScreen> createState() => _BiodataFormScreenState();
}

class _BiodataFormScreenState extends State<BiodataFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Personal Controllers
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _civilStatusController = TextEditingController();
  final _nationalityController = TextEditingController();

  // Contact & Address Controllers
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // Emergency Contact Controllers
  final _emergencyNameController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();
  final _emergencyRelationController = TextEditingController();

  // Educational & Professional Controllers
  final _educationController = TextEditingController();
  final _courseController = TextEditingController();
  final _skillsController = TextEditingController();
  final _languagesController = TextEditingController();
  final _experienceController = TextEditingController();
  final _certificatesController = TextEditingController();

  bool _isLoading = false;

  Future<void> _saveBiodata() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Biodata successfully submitted!'),
          backgroundColor: Colors.deepPurple,
          behavior: SnackBarBehavior.floating,
        ),
      );

      _formKey.currentState!.reset();
      _fullNameController.clear();
      _ageController.clear();
      _dobController.clear();
      _genderController.clear();
      _civilStatusController.clear();
      _nationalityController.clear();
      _addressController.clear();
      _emailController.clear();
      _phoneController.clear();
      _emergencyNameController.clear();
      _emergencyPhoneController.clear();
      _emergencyRelationController.clear();
      _educationController.clear();
      _courseController.clear();
      _skillsController.clear();
      _languagesController.clear();
      _experienceController.clear();
      _certificatesController.clear();

      setState(() => _isLoading = false);
    }
  }

  Widget _buildCategoryTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Icon(icon, color: Colors.deepPurple, size: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        validator: (value) =>
            value!.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 750),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Header Title
                  const Text(
                    'BIODATA',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Form Container Card
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            24,
                            20,
                            24,
                            10,
                          ),
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              children: [
                                _buildCategoryTitle(
                                  'Personal Information',
                                ),

                                _buildTextField(
                                  _fullNameController,
                                  'Full Name',
                                  Icons.person,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextField(
                                        _ageController,
                                        'Age',
                                        Icons.cake,
                                        keyboardType:
                                            TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTextField(
                                        _genderController,
                                        'Gender',
                                        Icons.wc,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextField(
                                        _dobController,
                                        'Date of Birth',
                                        Icons.calendar_month,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTextField(
                                        _civilStatusController,
                                        'Civil Status',
                                        Icons.favorite,
                                      ),
                                    ),
                                  ],
                                ),

                                _buildTextField(
                                  _nationalityController,
                                  'Nationality',
                                  Icons.flag,
                                ),

                                _buildCategoryTitle(
                                  'Contact Details',
                                ),

                                _buildTextField(
                                  _addressController,
                                  'Complete Address',
                                  Icons.home,
                                  maxLines: 2,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextField(
                                        _emailController,
                                        'Email Address',
                                        Icons.email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTextField(
                                        _phoneController,
                                        'Phone Number',
                                        Icons.phone,
                                        keyboardType:
                                            TextInputType.phone,
                                      ),
                                    ),
                                  ],
                                ),

                                _buildCategoryTitle(
                                  'Emergency Contact',
                                ),

                                _buildTextField(
                                  _emergencyNameController,
                                  'Contact Person Name',
                                  Icons.contact_emergency,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextField(
                                        _emergencyPhoneController,
                                        'Emergency Phone Number',
                                        Icons.phone_android,
                                        keyboardType:
                                            TextInputType.phone,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTextField(
                                        _emergencyRelationController,
                                        'Relationship',
                                        Icons.family_restroom,
                                      ),
                                    ),
                                  ],
                                ),

                                _buildCategoryTitle(
                                  'Education & Professional',
                                ),

                                _buildTextField(
                                  _educationController,
                                  'Highest Educational Attainment',
                                  Icons.school,
                                ),

                                _buildTextField(
                                  _courseController,
                                  'Course / Major / Year Level',
                                  Icons.book,
                                ),

                                _buildTextField(
                                  _skillsController,
                                  'Technical & Soft Skills',
                                  Icons.code,
                                  maxLines: 2,
                                ),

                                _buildTextField(
                                  _languagesController,
                                  'Languages Spoken',
                                  Icons.language,
                                ),

                                _buildTextField(
                                  _experienceController,
                                  'Work Experience / Projects',
                                  Icons.work,
                                  maxLines: 3,
                                ),

                                _buildTextField(
                                  _certificatesController,
                                  'Certificates / Achievements',
                                  Icons.military_tech,
                                  maxLines: 2,
                                ),

                                const SizedBox(height: 24),

                                SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _isLoading
                                        ? null
                                        : _saveBiodata,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                    ),
                                    child: _isLoading
                                        ? const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child:
                                                CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2.5,
                                            ),
                                          )
                                        : const Text(
                                            'SUBMIT BIODATA',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                  ),
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}