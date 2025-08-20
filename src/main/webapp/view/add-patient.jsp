<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gradient-to-r from-blue-200 via-purple-200 to-pink-200 flex items-center justify-center">

    <div class="bg-white/30 backdrop-blur-md rounded-2xl shadow-lg p-10 w-full max-w-md">
        <h2 class="text-3xl font-bold text-gray-800 mb-6 text-center">Add New Patient</h2>
        <form action="patients" method="post" class="space-y-4">

            <div>
                <label class="block text-gray-700 font-medium mb-1">Name:</label>
                <input type="text" name="name" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white/50">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Age:</label>
                <input type="number" name="age" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white/50">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Gender:</label>
                <select name="gender" required
                        class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white/50">
                    <option value="">--Select--</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Contact:</label>
                <input type="text" name="contact" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white/50">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1">Disease:</label>
                <input type="text" name="disease" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-400 bg-white/50">
            </div>

            <div class="text-center">
                <input type="submit" value="Add Patient"
                       class="px-6 py-2 rounded-full bg-purple-500 text-white font-semibold hover:bg-purple-600 transition duration-300 cursor-pointer">
            </div>

        </form>
        <div class="mt-4 text-center">
            <a href="patients" class="text-purple-700 hover:underline font-medium">Back to List</a>
        </div>
    </div>

</body>
</html>
