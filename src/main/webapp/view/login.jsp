<%-- 
    Document   : login
    Created on : Aug 24, 2025, 9:50:15 PM
    Author     : FAHIM
--%>

<%-- login.jsp --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page import="java.util.*" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Hospital Management System - Login</title>
                <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
                    integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />


                <script>
                    tailwind.config = {
                        theme: {
                            extend: {
                                colors: {
                                    'medical-blue': 'hsl(210, 100%, 56%)',
                                    'medical-blue-light': 'hsl(210, 100%, 90%)',
                                    'medical-green': 'hsl(142, 71%, 45%)',
                                    'medical-gray': 'hsl(215, 13%, 65%)',
                                    'primary': 'hsl(210, 100%, 56%)',
                                    'primary-glow': 'hsl(210, 100%, 70%)',
                                    'card': 'hsl(0, 0%, 100%)',
                                    'card-foreground': 'hsl(215, 25%, 27%)',
                                    'muted-foreground': 'hsl(215, 13%, 65%)',
                                    'border': 'hsl(210, 20%, 88%)',
                                    'background': 'hsl(210, 40%, 98%)',
                                    'foreground': 'hsl(215, 25%, 27%)'
                                },
                                keyframes: {
                                    'slide-in-right': {
                                        '0%': { transform: 'translateX(100%)', opacity: '0' },
                                        '100%': { transform: 'translateX(0)', opacity: '1' }
                                    },
                                    'slide-in-left': {
                                        '0%': { transform: 'translateX(-100%)', opacity: '0' },
                                        '100%': { transform: 'translateX(0)', opacity: '1' }
                                    },
                                    'float': {
                                        '0%, 100%': { transform: 'translateY(0px)' },
                                        '50%': { transform: 'translateY(-10px)' }
                                    }
                                },
                                animation: {
                                    'slide-in-right': 'slide-in-right 0.5s ease-out',
                                    'slide-in-left': 'slide-in-left 0.5s ease-out',
                                    'float': 'float 3s ease-in-out infinite'
                                },
                                backgroundImage: {
                                    'gradient-medical': 'linear-gradient(135deg, hsl(210, 100%, 56%), hsl(210, 100%, 70%))',
                                    'gradient-subtle': 'linear-gradient(180deg, hsl(210, 40%, 98%), hsl(210, 20%, 96%))'
                                },
                                boxShadow: {
                                    'medical': '0 10px 30px -10px hsl(210, 100%, 56%, 0.3)',
                                    'card': '0 4px 20px -8px hsl(210, 100%, 56%, 0.15)'
                                }
                            }
                        }
                    }
                </script>
                <style>
                    .medical-icon {
                        width: 62px;
                        height: 62px;
                        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640"><!--!Font Awesome Free v7.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M341.8 72.6C329.5 61.2 310.5 61.2 298.3 72.6L74.3 280.6C64.7 289.6 61.5 303.5 66.3 315.7C71.1 327.9 82.8 336 96 336L112 336L112 512C112 547.3 140.7 576 176 576L464 576C499.3 576 528 547.3 528 512L528 336L544 336C557.2 336 569 327.9 573.8 315.7C578.6 303.5 575.4 289.5 565.8 280.6L341.8 72.6zM288 312C288 303.2 295.2 296 304 296L336 296C344.8 296 352 303.2 352 312L352 352L392 352C400.8 352 408 359.2 408 368L408 400C408 408.8 400.8 416 392 416L352 416L352 456C352 464.8 344.8 472 336 472L304 472C295.2 472 288 464.8 288 456L288 416L248 416C239.2 416 232 408.8 232 400L232 368C232 359.2 239.2 352 248 352L288 352L288 312z"/></svg>') center/contain no-repeat;
                        color: hsl(210, 100%, 56%);

                    }

                    .tab-active {
                        background: linear-gradient(135deg, hsl(210, 100%, 56%), hsl(210, 100%, 70%));
                        color: white;
                    }

                    .tab-active2 {
                        background: linear-gradient(135deg, hsl(103, 65%, 51%), hsl(125, 51%, 49%));
                        color: white;
                    }

                    .tab-inactive {
                        background: transparent;
                        color: hsl(215, 13%, 65%);
                    }

/*                    @keyframes float {

                        0%,
                        100% {
                            transform: translateY(0px);
                        }

                        50% {
                            transform: translateY(-10px);
                        }
                    }*/

                    .animate-float {
                        animation: float 3s ease-in-out infinite;
                    }
                </style>
            </head>

            <body class="min-h-screen bg-sky-200">
                <!-- Navbar -->
                <nav class="bg-white shadow-md sticky top-0 z-50" style="background-color: rgb(247, 245, 239);">
                    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
                        <!-- Logo -->
                        <div class="flex items-center space-x-3">
                            <img src="img/5.png" class="h-10" alt="Logo" />

                        </div>

                        <!-- Desktop Menu -->
                        <div class="hidden md:flex space-x-6 text-sm">
                            <a href="#" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-1">Home</a>
                            <a href="#">About Us</a>
                            <a href="#">Specialities</a>
                            <a href="#">Health Check</a>
                            <a href="#">Online Report</a>
                            <a href="#">Patient Stories</a>
                            <a href="#">Career</a>
                        </div>

                        <!-- Mobile Menu Button -->
                        <div class="md:hidden">
                            <button id="menu-btn" class="text-gray-700 focus:outline-none">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2"
                                    viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M4 6h16M4 12h16M4 18h16" />
                                </svg>
                            </button>
                        </div>


                        <!-- Mobile Menu Dropdown -->
                        <div id="mobile-menu" class="md:hidden hidden px-4 pb-4">
                            <a href="#" class="block py-2 text-sm text-gray-700">Home</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">About Us</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">Specialities</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">Health Check</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">Online Report</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">Patient Stories</a>
                            <a href="#" class="block py-2 text-sm text-gray-700">Career</a>
                        </div>
                </nav>
                <!-- Background Medical Icons -->
                <div class="fixed inset-0 overflow-hidden pointer-events-none ">
                    <div class="medical-icon absolute top-20 left-10 opacity-20 animate-float"
                        style="animation-delay: 0s;"></i>
                    </div>
                    <div class="medical-icon absolute top-40 right-20 opacity-20 animate-float"
                        style="animation-delay: 1s;"></div>
                    <div class="medical-icon absolute bottom-40 left-20 opacity-20 animate-float"
                        style="animation-delay: 2s;">
                    </div>
                    <div class="medical-icon absolute bottom-20 right-10 opacity-20 animate-float"
                        style="animation-delay: 0.5s;">
                    </div>
                    <div class="medical-icon absolute top-1/2 left-1/4 opacity-20 animate-float"
                        style="animation-delay: 1.5s;">
                    </div>
                    <div class="medical-icon absolute top-1/3 right-1/3 opacity-20 animate-float"
                        style="animation-delay: 2.5s;">
                    </div>
                </div>

                <!-- Main Content -->
                <div class=" flex items-center justify-center relative z-10 mt-2 ">




                    <div class="w-full max-w-md bg-card rounded-lg shadow-card pb-2  bg-white px-8  ">

                        <img src="img/5.png" class=" mx-auto h-32 " alt="">


                        <!-- Header -->

                        <div class="formBody ">
                            <div class="text-center mb-6">


                                <p class="text-muted-foreground mt-1">Please sign in to your account</p>
                            </div>

                            <%-- Display error messages --%>
                                <% String error=(String) request.getAttribute("error"); if (error !=null) { %>
                                    <div class=" text-red-500 animate-pulse ">
                                        <%= error%>
                                    </div>
                                    <% } %>

                                        <%-- Display success messages --%>
                                            <% String success=(String) request.getAttribute("success"); if (success
                                                !=null) { %>
                                                <div class=" text-green-500 animate-pulse">
                                                    <%= success%>
                                                </div>
                                                <% } %>




                                                    <!-- Tab Switcher -->
                                                    <div class="flex mb-6 bg-gray-100 rounded-lg p-1 ">
                                                        <button id="patient-tab"
                                                            class="flex-1 py-2 px-4 rounded-md text-sm font-medium transition-all duration-200 tab-active cursor-pointer">
                                                            Patient Login
                                                        </button>
                                                        <button id="doctor-tab"
                                                            class="flex-1 py-2 px-4 rounded-md text-sm font-medium transition-all duration-200 tab-inactive cursor-pointer">
                                                            Doctor Login
                                                        </button>
                                                    </div>

                                                    <!-- Patient Form -->

                                                    <div id="patient-form" class="space-y-4">
                                                        <form
                                                            action="${pageContext.request.contextPath}/Login?role=patient"
                                                            method="post">
                                                            <div>
                                                                <label
                                                                    class="block text-sm font-medium text-card-foreground mb-2">Patient
                                                                    Name</label>
                                                                <input type="text" placeholder="Enter your patient ID"
                                                                    name="username"
                                                                    class="w-full px-3 py-2 border border-border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
                                                            </div>
                                                            <div>
                                                                <label
                                                                    class="block text-sm font-medium text-card-foreground mb-2">Phone
                                                                    Number</label>
                                                                <input type="tel" placeholder="Enter your phone number"
                                                                    name="phone"
                                                                    class="w-full px-3 py-2 border border-border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
                                                            </div>
                                                            <div>
                                                                <label
                                                                    class="block text-sm font-medium text-card-foreground mb-2">Date
                                                                    of Birth</label>
                                                                <input type="date" name="date"
                                                                    class="w-full px-3 py-2 border border-border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
                                                            </div>
                                                            <button type="submit"
                                                                class="w-full my-2  px-4 bg-gradient-medical text-white rounded-md font-medium hover:opacity-90 transition-opacity">
                                                                Sign In as Patient
                                                            </button>
                                                        </form>

                                                        <p class="text-center text-sm text-muted-foreground pb-4 ">
                                                            Don't have an account?
                                                            <a href="Registration.html"
                                                                class="text-primary hover:underline cursor-pointer">Register
                                                                here</a>
                                                        </p>
                                                    </div>

                                                    <!-- Doctor Form -->
                                                    <div id="doctor-form" class="space-y-4 hidden">
                                                        <form  action="${pageContext.request.contextPath}/Login?role=doctor"
                                                            method="post">
                                                        <div>
                                                            <label
                                                                class="block text-sm font-medium text-card-foreground mb-2">Email
                                                                Address</label>
                                                            <input type="email" placeholder="Enter your email" name="email"
                                                                class="w-full px-3 py-2 border border-border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
                                                        </div>
                                                        <div>
                                                            <label
                                                                class="block text-sm font-medium text-card-foreground mb-2">Password</label>
                                                            <input type="password" placeholder="Enter your password" name="password" 
                                                                class="w-full px-3 py-2 border border-border rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
                                                        </div>
                                                        <div class="flex items-center justify-between">
                                                            <!-- <label
                                                                class="flex items-center text-sm text-card-foreground">
                                                                <input type="checkbox"
                                                                    class="mr-2 rounded border-border">
                                                                Remember me
                                                            </label>
                                                            <a href="#"
                                                                class="text-sm text-primary hover:underline">Forgot
                                                                password?</a> -->
                                                        </div>
                                                        <button type="submit"
                                                            class="w-full py-2 my-2 px-4 bg-gradient-medical text-grey-700 rounded-md font-medium hover:opacity-90 transition-opacity">
                                                            Sign In as Doctor
                                                        </button>
                                                    </form>
                                                    </div>
                        </div>
                    </div>
                </div>

                <script>
                    // Tab switching functionality
                    const patientTab = document.getElementById('patient-tab');
                    const doctorTab = document.getElementById('doctor-tab');
                    const patientForm = document.getElementById('patient-form');
                    const doctorForm = document.getElementById('doctor-form');

                    function switchToPatient() {
                        patientTab.className = patientTab.className.replace('tab-inactive', 'tab-active');
                        doctorTab.className = doctorTab.className.replace('tab-active2', 'tab-inactive');

                        patientForm.classList.remove('hidden');
                        patientForm.classList.add('animate-slide-in-left');

                        doctorForm.classList.add('hidden');
                        doctorForm.classList.remove('animate-slide-in-right');
                    }

                    function switchToDoctor() {
                        doctorTab.className = doctorTab.className.replace('tab-inactive', 'tab-active2');
                        patientTab.className = patientTab.className.replace('tab-active', 'tab-inactive');

                        doctorForm.classList.remove('hidden');
                        doctorForm.classList.add('animate-slide-in-right');

                        patientForm.classList.add('hidden');
                        patientForm.classList.remove('animate-slide-in-left');
                    }

                    patientTab.addEventListener('click', switchToPatient);
                    doctorTab.addEventListener('click', switchToDoctor);

                    // Form submission handlers
                    document.querySelector('#patient-form button').addEventListener('click', function (e) {
                        e.preventDefault();
                        alert('Patient login functionality would be implemented here');
                    });

                    document.querySelector('#doctor-form button').addEventListener('click', function (e) {
                        e.preventDefault();
                        alert('Doctor login functionality would be implemented here');
                    });
                </script>
            </body>

            </html>
