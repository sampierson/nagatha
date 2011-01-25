task :ci do
  Rake::Task['spec'].invoke
  Rake::Task['cucumber'].invoke
end

