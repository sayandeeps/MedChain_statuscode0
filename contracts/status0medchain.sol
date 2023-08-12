pragma solidity ^0.8.18;

contract flowbits {
    
    struct patient{
        string patient_name;
        uint256 age;
        string gender;
        string height;
        uint256 weight;
        address patient_address;
        uint256 phone_no;
        string patient_home_adr;
        uint256 date;
        uint256 dob;
    }
    struct doctor{
        string doctor_name;
         string doctor_specialisation;
         uint256 doctor_ph_no;
         string doctor_qualification;
         address doctor_address;
    }
    struct appointment{
        address doctoraddr;
        address patientaddr;
        string date;
        string time;
        string description;
        string diagnosis;
        string status;
        uint creationDate;
    }
    address public owner;
    address[] public patientList;
    address[] public doctorList;
    address[] public appointmentList;

    mapping(address => patient) patientmap;
    mapping(address => doctor) doctormap;
    mapping(address => appointment) appointmentmap;

    mapping(address=>mapping(address=>bool)) isApproved;
    mapping(address => bool) isPatient;
    mapping(address => bool) isDoctor;

    constructor() public {
        owner = msg.sender;
    }

    //set patient details
    function setPatients(
        string memory _patient_name,
        uint256 _age,
        string memory _gender,
        string memory _height,
        uint256 _weight,
        uint256 _phone_no,
        string memory _patient_home_adr,
        uint256 _dob
    ) public{
        require(!isPatient[msg.sender]);
        patient storage p=patientmap[msg.sender];
        p.patient_name=_patient_name;
        p.age=_age;
        p.gender=_gender;
        p.height=_height;
        p.weight=_weight;
        p.phone_no=_phone_no;
        p.patient_address=msg.sender;
        p.date=block.timestamp;
        p.dob=_dob;

        patientList.push(msg.sender);
        isPatient[msg.sender]=true;
        isApproved[msg.sender][msg.sender]=true;
    }
    function editPatients(
        string memory _patient_name,
        uint256 _age,
        string memory _gender,
        string memory _height,
        uint256 _weight,
        uint256 _phone_no,
        string memory _patient_home_adr,
        uint256 _dob
    ) public{
        require(isPatient[msg.sender]);
        patient storage p=patientmap[msg.sender];
        p.patient_name=_patient_name;
        p.age=_age;
        p.gender=_gender;
        p.height=_height;
        p.weight=_weight;
        p.phone_no=_phone_no;
        p.patient_address=msg.sender;
        p.dob=_dob;
    }
    //store doctor details
    function setDoc(
        string memory _doctor_name,
         string memory _doctor_specialisation,
         uint256 _doctor_ph_no,
         string memory _doctor_qualification
    ) public{
        require(!isDoctor[msg.sender]);
        doctor storage d = doctormap[msg.sender];

        d.doctor_name=_doctor_name;
        d.doctor_specialisation = _doctor_specialisation;
        d.doctor_ph_no = _doctor_ph_no;
        d.doctor_qualification=_doctor_qualification;
        d.doctor_address=msg.sender;

        doctorList.push(msg.sender);
        isDoctor[msg.sender] = true;   
    }
    //edit doc
    function editDoc(
        string memory _doctor_name,
         string memory _doctor_specialisation,
         uint256 _doctor_ph_no,
         string memory _doctor_qualification
    ) public{
        require(isDoctor[msg.sender]);
        doctor storage d = doctormap[msg.sender];

        d.doctor_name=_doctor_name;
        d.doctor_specialisation = _doctor_specialisation;
        d.doctor_ph_no = _doctor_ph_no;
        d.doctor_qualification=_doctor_qualification;
        d.doctor_address=msg.sender;
    }

    //set appointment
    function setAppointments(
        address  _patientaddr,
        string memory _date,
        string memory _time,
        string memory _description,
        string memory _diagnosis,
        string memory _status
    ) public {
        require(isDoctor[msg.sender]);
        appointment storage a = appointmentmap[_patientaddr];

        a.doctoraddr = msg.sender;
        a.patientaddr= _patientaddr;
        a.date= _date;
        a.time= _time;
        a.description=_description;
        a.diagnosis=_diagnosis;
        a.status=_status;
        a.creationDate=block.timestamp;

        appointmentList.push(_patientaddr);
    }

    //update appointment
    function updateAppointments(
        address  _patientaddr,
        string memory _date,
        string memory _time,
        string memory _description,
        string memory _diagnosis,
        string memory _status
    ) public {
        require(isDoctor[msg.sender]);
        appointment storage a = appointmentmap[msg.sender];

        a.doctoraddr = msg.sender;
        a.patientaddr= _patientaddr;
        a.date= _date;
        a.time= _time;
        a.description=_description;
        a.diagnosis=_diagnosis;
        a.status=_status;
    }

    // permission given to doc to see records by patient 
    function givePermission(address docaddr) public returns(bool success) {
        isApproved[msg.sender][docaddr] = true;
        return true;
    }

    //revoke permission from doctor
    function RevokePermission(address docaddr) public returns(bool success) {
        isApproved[msg.sender][docaddr] = false;
        return true;
    }

    //Retrieve a list of all doctors address
    function getDoctors() public view returns(address[] memory) {
        return doctorList;
    }

    //Retrieve a list of all patients address
    function getPatients() public view returns(address[] memory) {
        return patientList;
    }

     //Retrieve a list of all appointments address
    function getAppointments() public view returns(address[] memory) {
        return appointmentList;
    }

    //Search patient details by entering a patient address (Only record owner or doctor with permission will be allowed to access)
    function searchPatient(address patientaddr) public view returns(
        string memory, uint256, string memory, string memory, uint256, uint256, address, uint256 
    ) {
        require(isApproved[patientaddr][msg.sender]);
        
        patient storage p = patientmap[patientaddr];
        
        return (p.patient_name, p.age, p.gender, p.height, p.weight, p.phone_no, p.patient_address, p.dob);
    }

        //Search appointment details by entering a patient address
    function searchAppointment(address patientaddr) public view returns(
        string memory, string memory, string memory, string memory, string memory) {
        require(isApproved[msg.sender][patientaddr]);
        appointment storage a = appointmentmap[patientaddr];
        


        

        return (
        a.date,
        a.time,
        a.description,
        a.diagnosis,
        a.status);
    }

        //Search patient record creation date by entering a patient address
    function searchRecordDate(address _address) public view returns(uint) {
        patient storage p = patientmap[_address];
        
        return (p.date);
    }

    //Search appointment creation date by entering a patient address
    function searchAppointmentDate(address _address) public view returns(uint) {
        appointment storage a = appointmentmap[_address];
        
        return (a.creationDate);
    }






}