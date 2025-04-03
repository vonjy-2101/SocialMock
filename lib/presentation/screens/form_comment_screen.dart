import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/post_entity.dart';

class FormCommentScreen  extends StatefulWidget {
    PostEntity post;
    FormCommentScreen({required this.post});
    FormCommentScreenState createState() => FormCommentScreenState();
}

class FormCommentScreenState extends State<FormCommentScreen>
{

    // Contrôleur pour le TextFormField
    final TextEditingController _textController = TextEditingController();
    
    // Clé pour le formulaire
    final _formKey = GlobalKey<FormState>();
    
    // Liste des personnes pour le dropdown
    final List<String> _personnes = ['Marie', 'Pierre', 'Sophie', 'Thomas'];
    
    // Personne sélectionnée dans le dropdown
    String? _personneSelectionnee;
    
    @override
    void dispose() {
        _textController.dispose();
        super.dispose();
    }

    void _envoyerFormulaire() {
        if (_formKey.currentState!.validate() && _personneSelectionnee != null) {
        // Afficher un message de confirmation
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text('Message envoyé à $_personneSelectionnee: ${_textController.text}'),
            backgroundColor: Colors.green,
            ),
        );
        
        // Réinitialiser le formulaire
        _formKey.currentState!.reset();
        _textController.clear();
        setState(() {
            _personneSelectionnee = null;
        });
        } else if (_personneSelectionnee == null) {
        // Afficher un message d'erreur si aucune personne n'est sélectionnée
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text('Veuillez sélectionner une personne'),
            backgroundColor: Colors.red,
            ),
        );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Formulaire'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                // Dropdown pour sélectionner une personne
                DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                    labelText: 'Sélectionner une personne',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    ),
                    value: _personneSelectionnee,
                    items: _personnes.map((String personne) {
                    return DropdownMenuItem<String>(
                        value: personne,
                        child: Text(personne),
                    );
                    }).toList(),
                    onChanged: (String? newValue) {
                    setState(() {
                        _personneSelectionnee = newValue;
                    });
                    },
                ),
                
                const SizedBox(height: 20),
                
                // Champ de texte
                TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                    labelText: 'Votre message',
                    hintText: 'Entrez votre message ici',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.message),
                    ),
                    maxLines: 3,
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un message';
                    }
                    return null;
                    },
                ),
                
                const SizedBox(height: 20),
                
                // Bouton d'envoi
                ElevatedButton(
                    onPressed: _envoyerFormulaire,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                    'ENVOYER',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ),
                ],
            ),
            ),
        ),
        );
    }
}